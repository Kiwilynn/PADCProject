// framework for our server
const express = require("express");
const app = express();

//firebase server validation and connection
const admin = require("firebase-admin");
let serviceAccount = require(__dirname + "/test-3ad87-bc8cc74b3d08.json");

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();
const docRef = db.collection("coffee").doc();


// Makes public folder static, so it's always accessable    
app.use(express.static("public"));


//frontpage
app.get("/", (req, res) =>{
    console.log("frontpage");
    return res.sendFile(__dirname + "/public/frontpage/frontpage.html");
});

app.get(("/frontpage.js"), (req, res) => {
    console.log("frontpage.js");
    return res.sendFile(__dirname + "/public/frontpage/frontpage.js");
});


//test route for database 
app.get("/test", (req, res) =>{
    // sends data to database
    let setCoffee = docRef.set({title: "test fra node 09/04"});
    
    // For loop goes thorugh our collection list and displays them in log. 
    db.collection('coffee').get()
    .then((snapshot) => {
      snapshot.forEach((doc) => {
        console.log(doc.id, '=>', doc.data());
        
      });
    })
    .catch((err) => {
      console.log('Error getting documents', err);
    });
    
});

//port we listing for incoming trafic
const port = process.env.PORT ? process.env.PORT : 8888;

const server = app.listen(port, (error) => {
    if (error) {
        console.log("Error starting the server");
    }
    console.log("This server is running on port", server.address().port);
});