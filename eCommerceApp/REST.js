
var mysql = require('mysql');
function REST_ROUTER(router,connection,md5) {
    var self = this;
    self.handleRoutes(router,connection,md5);
}
var username;

REST_ROUTER.prototype.handleRoutes= function(router,connection,md5) {
	var errorMess;

	//General page
	    router.get("/",function(req,res){
	    	res.json({"Message":"Sairam!"});
	    });

    //Users Page - Registration
    router.post("/registerUser",function(req,res){
        console.log("-------->REGISTER!");
        var query = "INSERT INTO ??(??,??,??,??,??,??,??,??,??) VALUES (?,?,?,?,?,?,?,?,?)";
        var table = [
	        "userdetail",
	        "fname",
	        "lname",
	        "address",
	        "city",
	        "state",
	        "zip",
	        "email",
	        "username",
	        "password",
	        req.body.fname,
	        req.body.lname,
	        req.body.address,
	        req.body.city,
	        req.body.state,
	        req.body.zip,
	        req.body.email,
	        req.body.username,
	        // md5(req.body.password),
	        req.body.password
	        // req.body.type
        ];
        var pattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
        var email = req.body.email;
        if(
            (req.body.state!=null && req.body.state.length!=2) 
            || (req.body.email!=null && (req.body.email.length = 0 || !pattern.test(req.body.email))) 
            || (req.body.zip!=null && (req.body.zip.length!=5 || isNaN(req.body.zip)))){
            // console.log("validation error!")
            // errorFlag = 1;
            res.json({
                "Message" : "there was a problem with your registration"
            });
        }

        /*if(req.body.state==null || req.body.email==null || req.body.zip==null
            || req.body.state==null || req.body.email==null || req.body.zip==null
            || req.body.fName==null || req.body.lName==null || req.body.username==null || req.body.password==null) {
            res.json({
                // "Error" : true, 
                "Message" : "There was a problem with your registration!"
            });        
        }*/

        else {
	        var uniqueCheckQuery = "select 1 from userdetail where ((username='"+req.body.username+"' and password = '"+req.body.password+"') or (fname='"+req.body.fname+"' and lname = '"+req.body.lname+"'))";
            console.log(uniqueCheckQuery);
            connection.query(uniqueCheckQuery,function(uniqueCheckErr,uniqueCheckRows){
                if(uniqueCheckErr)
                    res.json({
                        // "Error" : true, 
                        "Message" : "there was a problem with your registration"
                    });
                else if(uniqueCheckRows.length==0){
                    query = mysql.format(query,table);
                    console.log(query);
                    connection.query(query,function(err,rows){
                        if(err) {
                            res.json({
                                // "Error" : true, 
                                "Message" : "there was a problem with your registration"
                            });
                        } else {
                            res.json({
                                // "Error" : false, 
                                "Message" : "Your account has been registered "
                            });
                        }
                    });
                }
                else {
                    res.json({
                        "Message" : "there was a problem with your registration"
                    });
                } 
            });
    	}
    });

	//Login page
    router.post("/login",function(req,res){
        console.log("-------->LOGIN!");
        username = req.body.username;
        var password = req.body.password;
        var userType = null;
        // console.log("password is.."+password);
        var query = "SELECT * FROM ?? WHERE ?? = ? AND ?? = ?";
        var table = [
	        "userdetail",
	        "username",
	        username,
	        "password",
	        password
        ];
        if(username==null || password==null) { //either of the username/poassword paramters have not been sent
            console.log("Absence of login credentials!")
            res.json({
                "errMessage" : "Provide username and password parameters!", 
                "menu" : "",
                "sessionID" : ""
            });
        }
        if(username.length==0 || password.length==0) { //either username/password values are blank
        	console.log("login error!")
        	res.json({
        		"errMessage" : "Provide values for both the username and password parameters", 
        		"menu" : "",
        		"sessionID" : ""
        	});
        }
        else if(username.length>0 || password.length>0){ 
            
            //some paramter values have been passed for username and password
	        query = mysql.format(query,table);

	        connection.query(query,function(err,rows){
	        	console.log(query);
	            if(err) {
	            	// console.log(query);
	                res.json({
	                	"Message" : "Database connection error!"
	                });
	            } else if(rows.length==0){
	                res.json({
	                	"errMessage" : "That username and password combination was not correct", 
        				"menu" : "",
        				"sessionID" : ""
       			 	});
	            }
	            else if(rows.length>0){
	                var menuMess="";
                    //req.session.username=username;
                    userType=rows[0].type;
                    console.log(rows[0].type);
                    console.log(rows);
                    if(userType=="customer")
                            menuMess = "//updateInfo, //getProducts, //logout";
                    else if(userType=="admin")
                            menuMess = "//updateInfo, //viewUsers, //modifyProducts, //getProducts, //logout";
                    
                    //clearing previous logins of the same IP
                    var clearQuery="update session set isLoggedIn = 0 where ip ='"+req.connection.remoteAddress+"' and isLoggedIn = 1";
                    connection.query(clearQuery,function(clearErr,clearRows){
                        if(clearErr) console.log("Error clearing the previous logins!");
                        else console.log("Previous logins cleared!!");
                    });

                    //Storing the present session info
                    var insQuery = "insert into session(username,session_id,IP,isLoggedIn) values"
                    insQuery+=" ('"+username+"','"+req.sessionID+"','"+req.connection.remoteAddress+"',1)";
                    // console.log(insQuery);
                    connection.query(insQuery,function(insErr,insRows){
                        if(insErr) console.log("Error in session info insertion!");
                        else console.log("Session info inserted!!");
                    });
                    
                    //Providing user response
                    res.json({
	                	"errMessage" : "", 
        				"menu" : menuMess,
        				"sessionID" : req.sessionID
       			 	});
	            }
	        });
    	}
        else {//incorrect username password combination
            res.json({
                        "errMessage" : "That username and password combination was not correct", 
                        "menu" : "",
                        "sessionID" : ""
                    });
        }
    });

    //Logout
    router.post("/logout",function(req,res){
        console.log("-------->LOGOUT!");
        var mess;
        var ip = req.connection.remoteAddress;
        var sessionID = req.sessionID;
        var query = "select * from session where IP = '"+ip+"' and isLoggedIn = 1";
        console.log(query);
        connection.query(query,function(err,rows){
            if(rows.length > 0) {
                console.log("session exists!!!!!");
                mess = "You have been logged out";
                updQuery = "update session set isLoggedIn = 0 where isLoggedIn = 1 and IP = '"+ip+"'";
                connection.query(updQuery,function(updErr,updRows){
                    if(updErr) console.log("error updating session logout info!");
                    else console.log("session logout info updated!");
                });
                // req.session.username=null;
                // req.session.sessionID=null;
                // req.session.userType=null;
                req.session.destroy();
                res.json({
                    "message":mess       
                });
            }
            else {
                mess = "You are not currently logged in!";
                res.json({
                    "message":mess       
                });
            }
        });            
    });
    function getActiveUser(activeUser) {

    }
    //updateInfo
    router.post("/updateInfo",function(req,res){
        console.log("-------->UPDATEINFO!");
        var pattern = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
        var selQuery = "select u.type,s.* from session s inner join userdetail u on s.username = u.username where s.isLoggedIn=1 and s.ip='"+req.connection.remoteAddress+"'"
        var activeUser=null;
        // console.log(selQuery);
        connection.query(selQuery,function(err,selRows){
            // console.log(selRows);
            // console.log(selRows[0].username);
            if(err)
                console.log("Error in getting active user from DB!");
            else if(selRows.length==0)
                res.json({
                        "message":"Please log in"+activeUser
                    });
            else{
                activeUser = selRows[0].username;
                if(activeUser == null)
                    res.json({
                        "message":"Please log in"+activeUser
                    });
                else if(
                        (req.body.state!=null && req.body.state.length != 2) ||
                        (req.body.zip!=null && (isNaN(req.body.zip) || req.body.zip.length != 5)) ||
                        (req.body.email!=null && (req.body.email.length == 0 || !pattern.test(req.body.email)))
                    ) {
                    res.json({
                        "message":"There was a problem with this action"       
                    });
                }   
                else if(activeUser!=null /*&& req.body.sessionID!=null && req.body.sessionID!=""*/) {
                    var mess;
                    var querypart="";
                    if(req.body.fname!=null && req.body.fname.length > 0)
                        querypart+=",fname='"+req.body.fname+"' "
                    if(req.body.lname!=null && req.body.lname.length > 0)
                        querypart+=",lname='"+req.body.lname+"' " 
                    if(req.body.address!=null && req.body.address.length > 0)
                        querypart+=",address='"+req.body.address+"' " 
                    if(req.body.city!=null && req.body.city.length > 0)
                        querypart+=",city='"+req.body.city+"' "
                    if(req.body.state!=null && req.body.state.length == 2)
                        querypart+=",state='"+req.body.state+"' "
                    if(req.body.zip!=null && req.body.zip.length == 5)
                        querypart+=",zip='"+req.body.zip+"' "
                    if(req.body.email!=null && req.body.email.length > 0 && pattern.test(req.body.email))
                        querypart+=",email='"+req.body.email+"' "
                    if(req.body.username!=null && req.body.username.length > 0)
                        querypart+=",username='"+req.body.username+"' "
                    if(req.body.password!=null && req.body.password.length > 0)
                        querypart+=",password='"+req.body.password+"' "

                    var query = "UPDATE userdetail set userid=userid "+querypart+" WHERE username='"+activeUser+"'";
                    connection.query(query,function(err,rows){
                        console.log(query);
                        if(err)
                            res.json({
                                "message":"There was a problem with this action"       
                            });
                        else
                            res.json({
                                "message":"Your information has been updated"       
                            });
                    });
                }
            }
        });   
    });

    //modifyProduct
    router.post("/modifyProduct",function(req,res){
        console.log("-------->MODIFYPRODUCT!");
        var mess;
                var selQuery = "select u.type,s.* from session s inner join userdetail u on s.username = u.username where s.isLoggedIn=1 and s.ip='"+req.connection.remoteAddress+"'"
        var activeUser=null;
        // console.log(selQuery);
        connection.query(selQuery,function(err,selRows){
            // console.log(selRows);
            // console.log(selRows[0].username);
            if(err)
                console.log("Error in getting active user from DB!");
            else {
                activeUser = selRows[0];
                if(activeUser==null)
                    res.json({
                                "message":"Please login!"       
                    });
                else if(activeUser.type=="admin") {
                    if(req.body.productId == null || req.body.productDescription == null || req.body.productTitle == null)
                        res.json({
                                "message":"Provide product parameters"       
                        });
                    else {
                        var query = "UPDATE product set title= '"+req.body.productTitle+"', description ='"+req.body.productDescription+"' WHERE product_id='"+req.body.productId+"'";
                        connection.query(query,function(err,rows){
                            console.log(query);
                            if(err)
                                res.json({
                                    "message":"There was a problem with this action"       
                                });
                            else
                                res.json({
                                    "message":"The product information has been updated"       
                                });
                        });
                    } 
                }
                else {
                    res.json({
                                "message":"Login as admin"       
                    });
                }
            }
        });
    });
	//View users
	router.get("/viewUsers",function(req,res){
        console.log("-------->VIEW USER!");
        var selQuery = "select u.type,s.* from session s inner join userdetail u on s.username = u.username where s.isLoggedIn=1 and s.ip='"+req.connection.remoteAddress+"'"
        var activeUser=null;
        // console.log(selQuery);
        connection.query(selQuery,function(err,selRows){
            // console.log(selRows);
            // console.log(selRows[0].username);
            if(err)
                console.log("Error in getting active user from DB!");
            else {
                activeUser = selRows[0];
                if(activeUser==null)
                    res.json({
                                "message":"Please login!"       
                    });
                else if(activeUser.type=="admin") {
                    var query = "SELECT fname, lname FROM userdetail WHERE 1=1"
                    var queryPart="";
                    if(req.query.fname!=null)
                        queryPart+=" AND fname LIKE '%"+req.query.fname+"%'";
                    if(req.query.lname!=null)
                        queryPart+=" AND lname LIKE '%"+req.query.lname+"%'";
                    query+=queryPart;
                    connection.query(query,function(err,rows){
                    	console.log(query);
                        if(err) {
                        	// console.log(query);
                            res.json({
                            	// "Error" : true, 
                            	"errMessage" : "Database connection error!"
                            });
                        } else if(rows.length==0){
                            res.json({
                            	"errMessage" : "No such user!"
               			 	});
                        }
                        else if(rows.length>0){
                            var output = JSON.stringify(rows);
                            res.json({
            	            	"user_list":output    	
            	            });
                        }
                    });
            	}
                else if(activeUser.type=="customer")
                    res.json({
                                "message":"Please login as admin!"       
                    });
            }
        });
    });

    //View Products
	router.get("/getProducts",function(req,res){
        console.log("-------->GET PRODUCT!");
    	var query = "SELECT distinct p.title FROM product p INNER JOIN product_category_mapping c ON p.product_id = c.product_id WHERE 1=1";
        var queryPart="";
        if(req.query.productId!=null)
            queryPart+=" AND p.product_id ="+req.query.productId;
        if(req.query.keyword!=null)
            queryPart+=" AND (title LIKE '%"+req.query.productTitle+"%' OR description LIKE '%"+req.query.productTitle+"%')";
        query+=queryPart;
        connection.query(query,function(err,rows){
        	console.log(query);
            if(err) {
            	console.log(query);
                res.json({
                	// "Error" : true, 
                	"errMessage" : "Database connection error!"
                });
            } else if(rows.length==0){
                res.json({
                	"errMessage" : "No such product!"
   			 	});
            }
            else if(rows.length>0){
                var output = JSON.stringify(rows);
                res.json({
	            	"product_list":output    	
	            });
            }
        });
    	// }
    });
    
}

module.exports = REST_ROUTER;
