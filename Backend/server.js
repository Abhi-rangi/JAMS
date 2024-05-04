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
  host: "jams.ctgcq8w46uhl.us-east-2.rds.amazonaws.com",
  port: "3306",
  user: "admin",
  password: "SE_project_JAMS",
  database: "JAMS",
});

db.connect((error) => {
  if (error) throw error;
  console.log("Database connected successfully");
});

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
  if (vtype != "") {
    sqlQuery += `AND vehicle.vtype = '${vtype}';`;
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
  let date = req.query.date || "";
  let dbQueryParam = [lastName + "%"];
  let sqlQuery;

  // Check if date is provided in the query
  if (date) {
    // SQL query to select reservations within the date range
    sqlQuery = `
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
      WHERE customers.lname LIKE ? AND ? BETWEEN reservation.start_date AND reservation.end_date;
    `;
    dbQueryParam.push(date); // Add date parameter to the query parameters array
  } else {
    // SQL query to select reservations based only on last name
    sqlQuery = `
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
  }
  // console.log(sqlQuery);
  // console.log(lastName+'%');
  // Execute the SQL query with parameter
  db.query(sqlQuery, dbQueryParam, (error, results) => {
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
    [
      generateRandomString(8),
      vin,
      customerId,
      startDate,
      endDate,
      vin,
      startDate,
      endDate,
    ],
    (error, results) => {
      if (error) {
        console.error("Error creating reservation:", error);
        return res.status(500).send("Error creating reservation");
      }
      res.status(201).send("Reservation created successfully");
    }
  );
});
app.post("/signup", (req, res) => {
  const { fname, lname, age, email, phone, street, city, state, zipcode } =
    req.body;

  // SQL query
  const sql = `
      INSERT INTO customers (cid, age, phone, email, street, city, state, zipcode, fname, lname)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
    `;
  const customerId = generateRandomString(10);
  // Execute the query
  db.query(
    sql,
    [customerId, age, phone, email, street, city, state, zipcode, fname, lname],
    (error, results) => {
      if (error) {
        console.error("Error creating reservation:", error);
        return res.status(500).send("Error creating sign up");
      }
      res.status(201);
      let res_customer = { cid: customerId, lname: lname ,fname:fname,age:age,email:email,phone:phone};
      res.json(res_customer);
      console.log(customerId);
    }
  );
});

app.put("/reservations/:rid", (req, res) => {
  const { vin, customerId, start_date, end_date } = req.body;
  const rid = req.params.rid;

  const sql = `
      UPDATE reservation
      SET vin = ?, cid = ?, start_date = ?, end_date = ?
      WHERE rid = ?;
    `;
  db.query(
    sql,
    [vin, customerId, start_date, end_date, rid],
    (error, results) => {
      if (error) {
        console.error("Error updating reservation:", error);
        return res.status(500).send("Error updating reservation");
      }
      if (results.affectedRows === 0) {
        return res.status(404).send("Reservation not found");
      }
      res.status(200).send("Reservation updated successfully");
    }
  );
});

app.delete("/reservations/:rid", (req, res) => {
  const rid = req.params.rid;
  console.log("Here in delte method", req.body);
  const sql = `DELETE FROM reservation WHERE rid = ?;`;
  db.query(sql, [rid], (error, results) => {
    if (error) {
      console.error("Error deleting reservation:", error);
      return res.status(500).send("Error deleting reservation");
    }
    if (results.affectedRows === 0) {
      return res.status(404).send("Reservation not found");
    }
    res.status(200).send("Reservation deleted successfully");
  });
});
// GET reservation details by rid
app.get("/reservations/:rid", (req, res) => {
    const { rid } = req.params;
    const sql = `
        SELECT 
            r.cid AS customerId,
            CONCAT(c.fname, ' ', c.lname) AS customerName,
            v.vtype AS vtype,
            r.vin,
            r.start_date AS startDate,
            r.end_date AS endDate
        FROM reservation r
        JOIN customers c ON r.cid = c.cid
        JOIN vehicle v ON r.vin = v.vin
        WHERE r.rid = ?;
    `;

    db.query(sql, [rid], (error, results) => {
        if (error) {
            console.error("Error fetching reservation:", error);
            return res.status(500).send("Error fetching reservation details");
        }
        if (results.length === 0) {
            return res.status(404).send("Reservation not found");
        }
        res.status(200).json(results[0]);  // Send back the first (and should be only) result
    });
});

app.get("/customers", (req, res) => {
  const { lname, cid } = req.query;
  let sqlQuery;
  let queryParams = [];

  if (lname) {
    // Query to find customers by last name
    sqlQuery = `
            SELECT cid,fname,lname,email,phone,age FROM customers
            WHERE lname LIKE ?;
        `;
    queryParams.push(lname + "%");
  } else if (cid) {
    // Query to find customers by customer ID
    sqlQuery = `
            SELECT cid,fname,lname,email,phone,age FROM customers
            WHERE cid = ?;
        `;
    queryParams.push(cid);
  } else {
    return res.status(400).json({ error: "No search parameters provided" });
  }

  // Execute the SQL query
  db.query(sqlQuery, queryParams, (error, results) => {
    if (error) {
      console.error("Error fetching customer data:", error);
      return res.status(500).send("Error fetching customer data");
    }
    if (results.length > 0) {
      res.json(results); // Send the query results as JSON response
    } else {
      res.status(404).send("No customers found");
    }
  });
});

// Start the server
if (process.env.NODE_ENV !== "test") {
  app.listen(port, () => {
    console.log(`Server running on port ${port}`);
  });
}
module.exports = app;
