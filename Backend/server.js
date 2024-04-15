  const express = require("express");
  const mysql = require("mysql2");
  const bodyParser = require("body-parser");
  const cors = require("cors");
  const generateRandomString = require("./func");
  const app = express();
  const port = 3001;
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

  // app.get("/vehicles", (req, res) => {
  //  const vtype = req.query.vtype; // Retrieve the vtype query parameter from the request

  //  let query = "SELECT * FROM vehicle";
  //  let params = [];

  //  if (vtype) {
  //    query += " WHERE vtype = ?";
  //    params.push(vtype);
  //  }

  //  db.query(query, params, (error, results) => {
  //    if (error) {
  //      console.error("Error executing query:", error);
  //      return res.status(500).json({ error: "Internal server error" });
  //    }
  //    res.json(results);
  //  });
  // });
  // Endpoint to fetch distinct vehicle types
  app.get("/vehicle-types", (req, res) => {
    db.query("SELECT DISTINCT vtype FROM vehicle", (error, results) => {
      if (error) {
        console.error("Error fetching vehicle types:", error);
        return res.status(500).send("Error fetching vehicle types");
      }
      res.json(results);
    });
  });
  app.get("/vehicles", (req, res) => {
    const { startDate, endDate, vtype } = req.query;
    let sqlQuery = `
          SELECT vehicle.vin, vehicle.make, vehicle.model, vehicle.seating, vehicle.mpg, vehicle.vtype
          FROM vehicle
          LEFT JOIN reservation ON vehicle.vin = reservation.vin
          WHERE vehicle.vin NOT IN (
              SELECT reservation.vin 
              FROM reservation 
              WHERE (reservation.start_date <= '${endDate}' AND reservation.end_date >= '${startDate}')
          )
        
      `; 
    if(vtype!=''){
      sqlQuery += `AND vehicle.vtype = '${vtype}';`
    }
    // Execute the SQL query
    db.query(sqlQuery, (error, results) => {
      if (error) {
        console.error("Error fetching vehicle stats:", error);
        return res.status(500).json({ error: "Error fetching vehicle stats" });
      }
      res.json(results); // Send the query results as JSON response
    });
  });

  app.get("/reservations", (req, res) => {
    // Extract the last name from the request query parameter
    let lastName = req.query.lastName || ""; // Default to an empty string if not provided
    console.log(lastName + '..................');
    // SQL query using parameterized inputs to prevent SQL injection
    let sqlQuery = `
      SELECT customers.lname,
            customers.fname,
            reservation.start_date,
            reservation.end_date,
            vehicle.make,
            vehicle.model,
              reservation.rid
      FROM customers
        JOIN reservation ON customers.cid = reservation.cid
        JOIN vehicle ON reservation.vin = vehicle.vin
      WHERE customers.lname LIKE ?;
    `;
    console.log(sqlQuery);
    console.log(lastName+'%');
    // Execute the SQL query with parameter
    db.query(sqlQuery, [lastName+'%'], (error, results) => {
      if (error) {
        console.error("Error fetching reservation stats:", error);
        return res
          .status(500)
          .json({ error: "Error fetching reservation details" });
      }
      res.json(results); // Send the query results as JSON response
    });
  });

  app.post("/reservations", (req, res) => {
    const { customerName, customerId, vtype, vin, startDate, endDate } = req.body;

    // SQL query
    const sql = `
      INSERT INTO reservation (rid, vin, cid, ccnum, insurance, start_date, end_date)
      VALUES (?, ?, ?, '1234567890123456', 0, ?, ?);
    `;
    //giving insurance as 0 for insurance
    // Execute the query
    db.query(
      sql,
      [generateRandomString(8), vin, customerId, startDate, endDate,vin,startDate,endDate],
      (error, results) => {
        if (error) {
          console.error("Error creating reservation:", error);
          return res.status(500).send("Error creating reservation");
        }
        res.status(201).send("Reservation created successfully");
      }
    );
  });




  // Start the server
  app.listen(port, () => {
    console.log(`Server running on port ${port}`);
  });
