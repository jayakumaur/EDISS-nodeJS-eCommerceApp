/*
lineReader will extract the records from amazon-meta.txt one at a time as
file is too large to read all at once.  In order to add records to a database you need to add code below to insert records

This code depnds on "line-reader"

You need to install line-reader by using the following command:
npm install line-reader

*/

//mysql connection settings
var mysql = require("mysql");

// function REST(){
//     var self = this;
//     self.connectMysql();
// };
// //mysql connection
// REST.prototype.connectMysql = function() {
//     var self = this;
//     var pool      =    mysql.createPool({
//         connectionLimit : 100,
//         host     : 'localhost',
//         user     : 'root',
//         password : 'sairam',
//         database : 'ediss',
//         debug    :  false
//     });
//     pool.getConnection(function(err,connection){
//         if(err) {
//           self.stop(err);
//         } else {
//           self.configureExpress(connection);
//         }
//     });
// }
var connection = mysql.createConnection({
   host     : 'localhost',
   user     : 'root',
   password : 'sairam',
   database : 'ediss'
 });
 connection.connect();


var lineReader = require('line-reader');

var record = new Object();
record.categories = [];
var jsonRecord;
var already = false;
var categories = false;
var categoryCount = 0;

lineReader.eachLine('amz.txt', function(line, last) {

  if(line.indexOf("Id:")>=0){
    if(already){

      //create JSON object for complete record
      jsonRecord = JSON.stringify(record,null,2);
      console.log(jsonRecord);
      var query = "insert into prd values ("+record.Id+",'"+record.ASIN+"','"+record.title+"','','"+record.group+"')";
      console.log(query);
      connection.query(query,function(err,rows){
        if(err)
          console.log("mysql error-----\n"+err);
        else {
          console.log("record "+record.Id+" inserted");
          //product category mapping
          insertProdMap(record);
        }
      });


      /****************************************
      *****************************************
      add code to insert record in your db here
      *****************************************
      ****************************************/


      //reinitialize record and add Id value
      record = new Object();
      record.categories = [];
      record.Id = subStr;
      already = false;
    }
  }
    if(line.indexOf("Id:")>=0) {
      //For the first record read Id and record it
      var subStr = line.substring(line.indexOf("Id:")+3).trim();
      record.Id = subStr;

      //inidicate that the Id value has been captured so that the next Id value indicates end of current record
      already = true;
      //console.log(record.Id);
    }

  else if(line.indexOf("ASIN:")>=0){
    //record the ASIN
    var subStr = line.substring(line.indexOf("ASIN:")+5).trim();
    record.ASIN = subStr;
    //console.log(record.ASIN);
  }

  else if(line.indexOf("title:")>=0){
    //record the title
    line = line.trim();
    var subStr = line.substring(line.indexOf("title:")+6).trim();
    record.title = subStr;
  }

  else if(line.indexOf("group:")>=0){
    //record the group
    var subStr = line.substring(line.indexOf("group:")+6).trim();
    record.group = subStr;
  }

  else if(line.indexOf("categories:")>=0 || categories){
    if(!categories) {
      record.categoryCount=line.substring(line.indexOf(":")+1).trim();
      categories = true;
    }
    else {
      //Check if there are more categories to record and make sure we haven't started reading reviews
      if((line.indexOf("categories:")>=0||categories) && !(line.indexOf("reviews:")>0)){
        //record the categories -- there might be more than one category so have to continue reading until we get to "reviews"
        var subStr = line.substring(line.indexOf("categories:")).trim();
        record.categories.push(subStr) ;
        // categories = true;
      } else {
        categories = false;
      }
    }

  }

 if (last) {
    console.log(JSON.stringify(record,null,2));
    return false; // stop reading
  }
});

//inserting product category mapping records
var insertProdMap = function(record) {
  var count = record.categoryCount;
  for(var i=0;i<count;i++) {
    var query1 = "insert into prd_map(product_id,category) values("+record.Id+",'"+record.categories[i]+"')"; 
    console.log(query1);
    connection.query(query,function(err,rows){
      if(err)
        console.log("mysql error11");
      else 
        console.log("mapping"+i+" for "+record.Id+" entered..");
    });
  }
}