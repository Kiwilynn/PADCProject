// same as app function in app.js just called router
const router = require("express").Router();

//firebase server validation and connection
const admin = require("firebase-admin");
let serviceAccount = require("../test-3ad87-bc8cc74b3d08.json");

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();
const docRef = db.collection("coffee").doc();


//test route for database 
router.get("/test", (req, res) =>{
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

module.exports = router