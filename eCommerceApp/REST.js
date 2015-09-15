
var mysql = require('mysql');
function REST_ROUTER(router,connection,md5) {
    var self = this;
    self.handleRoutes(router,connection,md5);
}

REST_ROUTER.prototype.handleRoutes= function(router,connection,md5) {
	var errorMess;

	//General page
	    router.get("/",function(req,res){
	    	res.json({"Message":"Sairam!"});
	    });

    //Users Page - Registration
    router.post("/registerUser",function(req,res){
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
	        req.query.fname,
	        req.query.lname,
	        req.query.address,
	        req.query.city,
	        req.query.state,
	        req.query.zip,
	        req.query.email,
	        req.query.username,
	        // md5(req.query.password),
	        req.query.password
	        // req.query.type
        ];
        var pattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
        var email = req.query.email;
        if(
            (req.query.state!=null && req.query.state.length!=2) 
            || (req.query.state!=null && req.query.email==null) 
            || (req.query.zip!=null && (req.query.zip.length!=5 || isNaN(req.query.zip)))){
            console.log("validation error!")
            errorFlag = 1;
            res.json({
                "Message" : "There was a problem with your registration!"
            });
        }

        /*if(req.query.state==null || req.query.email==null || req.query.zip==null
            || req.query.state==null || req.query.email==null || req.query.zip==null
            || req.query.fName==null || req.query.lName==null || req.query.username==null || req.query.password==null) {
            res.json({
                // "Error" : true, 
                "Message" : "There was a problem with your registration!"
            });        
        }*/

        else {
	        query = mysql.format(query,table);
	        connection.query(query,function(err,rows){
	            if(err) {
	                res.json({
	                	// "Error" : true, 
	                	"Message" : "There was a problem with your registration!"
                    });
	            } else {
	                res.json({
	                	// "Error" : false, 
	                	"Message" : "Your account has been registered!"
                    });
	            }
	        });
    	}
    });

	//Login page
    router.post("/login",function(req,res){
	var query = "SELECT * FROM ?? WHERE ?? = ? AND ?? = ?";
        var table = [
	        "userdetail",
	        "username",
	        req.query.username,
	        "password",
	        req.query.password
        ];
        if(req.query.username.length==0 || req.query.password.length==0) {
        	console.log("login error!")
        	res.json({
        		"errMessage" : "Enter both username and password", 
        		"menu" : "",
        		"sessionID" : ""
        	});
        }
        else if(req.query.username.length>0 || req.query.password.length>0){
	        query = mysql.format(query,table);
	        connection.query(query,function(err,rows){
	        	console.log(query);
	            if(err) {
	            	// console.log(query);
	                res.json({
	                	// "Error" : true, 
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
                    req.session.username=req.query.username;
                    req.session.userType=rows[0].type;
                    console.log(req.session.userType);
                    console.log(rows[0].type);
                    console.log(rows);
                    if(req.session.userType=="customer")
                            menuMess = "UpdateContactInformation, View Products, Logout";
                    else if(req.session.userType=="admin")
                            menuMess = "UpdateContactInformation, View Users, Modify products, View Products, Logout";
                    
                    sess = req.session;
                    res.json({
	                	"errMessage" : "", 
        				"menu" : menuMess,
        				"sessionID" : req.sessionID
       			 	});
	            }
	        });
    	}
        else {
            res.json({
                        "errMessage" : "That username and password combination was not correct", 
                        "menu" : "",
                        "sessionID" : ""
                    });
        }
    });

    //Logout
    router.post("/logout",function(req,res){
        var mess;
        if(req.session.username) {
            console.log("session exists!!!!!");
            mess = "You have been logged out";
            req.session.username=null;
            req.session.userType=null;
            req.session.destroy();
        }
        else
            mess = "You are not currently logged in!";
        res.json({
            "message":mess       
        });
    });

    //updateInfo
    router.post("/updateInfo",function(req,res){
        if(req.session.username!=null && req.query.sessionID!=null && req.query.sessionID!="") {
            var mess;
            var querypart="";
            if(req.query.fName!=null && req.query.fName.length > 0)
                querypart+=",fname='"+req.query.fName+"' "
            if(req.query.lName!=null && req.query.lName.length > 0)
                querypart+=",lname='"+req.query.lName+"' " 
            if(req.query.address!=null && req.query.address.length > 0)
                querypart+=",address='"+req.query.address+"' " 
            if(req.query.city!=null && req.query.city.length > 0)
                querypart+=",city='"+req.query.city+"' "
            if(req.query.state!=null && req.query.state.length == 2)
                querypart+=",state='"+req.query.state+"' "
            if(req.query.zip!=null && req.query.zip.length == 5)
                querypart+=",zip='"+req.query.zip+"' "
            if(req.query.email!=null && req.query.email.length > 0 && req.query.email.match("/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/"))
                querypart+=",email='"+req.query.email+"' "
            if(req.query.uName!=null && req.query.uName.length > 0)
                querypart+=",username='"+req.query.uName+"' "
            if(req.query.pWord!=null && req.query.pWord.length > 0)
                querypart+=",password='"+req.query.pWord+"' "
            var query = "UPDATE userdetail set userid=userid "+querypart+" WHERE username='"+req.session.username+"'";
            connection.query(query,function(err,rows){
                console.log(query);
                if(err)
                    res.json({
                        "message":"There was a problem with this action!"       
                    });
                else
                    res.json({
                        "message":"The product information has been updated!"       
                    });
            });
        }
        else if(req.session.username == null)
            res.json({
                        "message":"Please log in!"       
            });
        else if(req.query.sessionID == null || req.query.sessionID == "")
            res.json({
                        "message":"There was a problem with this action!"       
            });    

    });

    //modifyProduct
    router.post("/modifyProduct",function(req,res){
        var mess;
        if(req.session.userType=="admin") {
            var query = "UPDATE product set title= '"+req.query.productTitle+"', description ='"+req.query.productDescription+"' WHERE product_id='"+req.query.productId+"'";
            connection.query(query,function(err,rows){
                console.log(query);
                if(err)
                    res.json({
                        "message":"There was a problem with this action!"       
                    });
                else
                    res.json({
                        "message":"The product information has been updated!"       
                    });
            }); 
        }
        else {
            res.json({
                        "message":"Login as admin!"       
            });
        }
    });
	//View users
	router.get("/viewUsers",function(req,res){
        if(req.session.userType=="admin") {
            // var query = "SELECT username, concat(fName,lName) as Name FROM ?? WHERE ?? LIKE ? AND ?? LIKE ?";
            var query = "SELECT * FROM userdetail WHERE 1=1"
            var queryPart="";
            if(req.query.fName!=null)
                queryPart+=" AND fName LIKE '%"+req.query.fName+"%'";
            if(req.query.lName!=null)
                queryPart+=" AND lName LIKE '%"+req.query.lName+"%'";
            query+=queryPart;
            // var table = [
    	       //  "userdetail",
    	       //  "fName",
    	       //  "%"+req.query.fName+"%",
    	       //  "lName",
    	       //  "%"+req.query.lName+"%"
            // ];
            // query = mysql.format(query,table);
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
        else if(req.session.userType=="customer")
            res.json({
                        "message":"Please login as admin!"       
            });
        else if(req.session.userType==null)
            res.json({
                        "message":"Please login!"       
            });
    });

    //View Products
	router.get("/getProducts",function(req,res){
    	var query = "SELECT distinct p.* FROM product p INNER JOIN product_category_mapping c ON p.product_id = c.product_id WHERE 1=1";
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