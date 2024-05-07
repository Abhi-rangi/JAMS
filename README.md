
---

# JAMS Project Setup Guide

## Overview
This guide provides instructions for setting up the backend and frontend components of the JAMS project, as well as connecting to the AWS RDS database.
## RECORDING LINK :
https://tu-my.sharepoint.com/:v:/g/personal/arangi1_students_towson_edu/EQ19Bny7MtJOllqK_RpLdfcBvCiofWzH3Ugq4fju5K5rGw?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=CygaSF
### Prerequisites
- Node.js (v18.17.0) is used
- npm (v9.6.7) is used
- Access to AWS RDS

## Backend Setup
1. **Navigate to the Backend directory**:
   ```sh
   cd /Backend
   ```

2. **Install dependencies**:
   ```sh
   npm install
   ```

3. **Start the server**:
   - To start the server with automatic recompilation on file changes:
     ```sh
     nodemon server.js
     ```
   - To start the server without automatic recompilation:
     ```sh
     node server.js
     ```
   - The server will be hosted at `localhost:3001`.

4. **Run tests**:
   ```sh
   npm run test
   ```

## Frontend Setup
1. **Navigate to the Frontend directory**:
   ```sh
   cd /FrontEnd/jams
   ```

2. **Install dependencies**:
   ```sh
   npm install
   ```

3. **Start the frontend**:
   ```sh
   npm run dev
   ```
   - The frontend will be hosted at `localhost:3000`.

## Database Connection
- **AWS RDS Details**:
  - Host: `jams.ctgcq8w46uhl.us-east-2.rds.amazonaws.com`
  - Port: `3306`
  - Note: This is a 12-month free RDS instance available on AWS.

---

This revision organizes the content for better navigation and clarity, providing clear, actionable steps for each part of the setup process.



Here's a summary of each endpoint in your server code, including the HTTP method used and the database query executed:

1. **Endpoint:** `/vehicle-types`
   - **HTTP Method:** GET
   - **Database Query:** 
     ```sql
     SELECT DISTINCT vtype FROM vehicle
     ```

2. **Endpoint:** `/vehicles`
   - **HTTP Method:** GET
   - **Database Query:** Dynamic based on provided `vtype`:
     ```sql
     SELECT vehicle.vin, vehicle.make, vehicle.model, vehicle.seating, vehicle.mpg, vehicle.vtype
     FROM vehicle
     LEFT JOIN reservation ON vehicle.vin = reservation.vin
     WHERE vehicle.vin NOT IN (
         SELECT reservation.vin 
         FROM reservation 
         WHERE (reservation.start_date <= '${endDate}' AND reservation.end_date >= '${startDate}')
     ) AND vehicle.vtype = '${vtype}';
     ```

3. **Endpoint:** `/reservations`
   - **HTTP Method:** GET
   - **Database Query:** Dynamic based on whether a date is provided:
     ```sql
     SELECT customers.lname, customers.fname, reservation.start_date, reservation.end_date, vehicle.make, vehicle.model, reservation.rid
     FROM customers
     JOIN reservation ON customers.cid = reservation.cid
     JOIN vehicle ON reservation.vin = vehicle.vin
     WHERE customers.lname LIKE ? AND ? BETWEEN reservation.start_date AND reservation.end_date;
     ```

4. **Endpoint:** `/reservations`
   - **HTTP Method:** POST
   - **Database Query:**
     ```sql
     INSERT INTO reservation (rid, vin, cid, ccnum, insurance, start_date, end_date)
     VALUES (?, ?, ?, '1234567890123456', 0, ?, ?);
     ```

5. **Endpoint:** `/signup`
   - **HTTP Method:** POST
   - **Database Query:**
     ```sql
     INSERT INTO customers (cid, age, phone, email, street, city, state, zipcode, fname, lname)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
     ```

6. **Endpoint:** `/reservations/:rid`
   - **HTTP Method:** PUT
   - **Database Query:**
     ```sql
     UPDATE reservation
     SET vin = ?, cid = ?, start_date = ?, end_date = ?
     WHERE rid = ?;
     ```

7. **Endpoint:** `/reservations/:rid`
   - **HTTP Method:** DELETE
   - **Database Query:**
     ```sql
     DELETE FROM reservation WHERE rid = ?;
     ```

8. **Endpoint:** `/reservations/:rid`
   - **HTTP Method:** GET
   - **Database Query:**
     ```sql
     SELECT r.cid AS customerId, CONCAT(c.fname, ' ', c.lname) AS customerName, v.vtype AS vtype, r.vin, r.start_date AS startDate, r.end_date AS endDate
     FROM reservation r
     JOIN customers c ON r.cid = c.cid
     JOIN vehicle v ON r.vin = v.vin
     WHERE r.rid = ?;
     ```

Each endpoint is designed to handle specific operations on the database, such as retrieving, inserting, updating, or deleting records. The methods and queries are tailored to interact with the vehicle and reservation systems effectively.
