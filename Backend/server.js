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
  db.query("SELECT * FROM vehicle", (error, results) => {
    if (error) throw error;
    res.json(results);
  });
});

// Start the server
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
