var express = require("express");
var mysql   = require("mysql");
var bodyParser  = require("body-parser");
var md5 = require('MD5');
var session = require('express-session');
var cookieParser = require('cookie-parser');
var rest = require("./REST.js");
var app  = express();
var sess=null;

app.use(cookieParser());
app.use(session({secret:'somesecrettoken'}));

function REST(){
    var self = this;
    self.connectMysql();
};

REST.prototype.connectMysql = function() {
    var self = this;
    var pool      =    mysql.createPool({
        connectionLimit : 100,
        host     : 'localhost',
        user     : 'root',
        password : 'sairam',
        database : 'ediss',
        debug    :  false
    });
    pool.getConnection(function(err,connection){
        if(err) {
          self.stop(err);
        } else {
          self.configureExpress(connection);
        }
    });
}

REST.prototype.configureExpress = function(connection) {
      var self = this;
      app.use(bodyParser.urlencoded({ extended: true }));
      app.use(bodyParser.json());

      var router = express.Router();
      app.use('/api', router);
      // Handle 404
      app.use(function(req, res) {
         res.send('HTTP 404: Page not Found \n Please contact the administrator!', 404);
      });
      
      // Handle 500
      app.use(function(error, req, res, next) {
         res.send('HTTP 500: Internal Server Error\n Please contact the administrator!', 500);
      });
      var rest_router = new rest(router,connection,md5);
      self.startServer();
}

REST.prototype.startServer = function() {
      app.listen(8081,function(){
          console.log("All right ! I am alive at Port 8081.");
      });
}

REST.prototype.stop = function(err) {
    console.log("ISSUE WITH MYSQL \n" + err);
    process.exit(1);
}

new REST();
