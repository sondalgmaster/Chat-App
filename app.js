import express from "express";
import dotenv from "dotenv";
import mysql from "mysql";
import nodemailer from "nodemailer";
import fs from "fs/promises";

// Initialize the app and load environment variables
const app = express();
dotenv.config();

const port = process.env.PORT || 3000;

// Set up middleware
app.use(express.static("public"));
app.use(express.urlencoded({ extended: true }));

// Set up EJS as the view engine
app.set('view engine', 'ejs');


//chat Databse
const chatDB = mysql.createConnection({
    host: 'localhost',
    user: dbUser,
    password: dbPass, 
    database: 'Chat'
});

//Defoult
app.get('/', (req, res) => {  

    res.render('index');
});


// Error handling middleware
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).send('Something went wrong!');
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});