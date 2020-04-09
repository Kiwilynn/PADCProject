const express = require("express");
const app = express();

const firebase = require("firebase-admin");
let serviceAccount = require(__dirname + "/test-3ad87-bc8cc74b3d08.json");

firebase.initializeApp({
    credential: firebase.credential.cert(serviceAccount)
});

const db = firebase.firestore();

let docRef = db.collection("coffe").doc();




app.get("/", (req, res) =>{
    console.log("frontpage")

    return res.sendFile(__dirname + "/public/frontpage.html");
});



app.listen(8888);