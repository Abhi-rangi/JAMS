const express = require("express");
const mysql = require("mysql2");
const bodyParser = require("body-parser");
const cors = require("cors");

const app = express();
const port = 3000;
app.use(cors());


app.use(bodyParser.json());

// Database connection
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "RoronovaZoro@3",
  database: "JAMS",
});

db.connect((error) => {
  if (error) throw error;
  console.log("Database connected successfully");
});

// Define routes
app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.get("/vehicles", (req, res) => {
 const vtype = req.query.vtype; // Retrieve the vtype query parameter from the request

 let query = "SELECT * FROM vehicle";
 let params = [];

 if (vtype) {
   query += " WHERE vtype = ?";
   params.push(vtype);
 }

 db.query(query, params, (error, results) => {
   if (error) {
     console.error("Error executing query:", error);
     return res.status(500).json({ error: "Internal server error" });
   }
   res.json(results);
 });
});
// Endpoint to fetch distinct vehicle types
app.get('/vehicle-types', (req, res) => {
    db.query('SELECT DISTINCT vtype FROM vehicle', (error, results) => {
        if (error) {
            console.error('Error fetching vehicle types:', error);
            return res.status(500).send('Error fetching vehicle types');
        }
        res.json(results);
    });
});


// Start the server
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
