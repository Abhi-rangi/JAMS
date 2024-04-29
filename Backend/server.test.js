const request = require("supertest");
const mysql = require("mysql2");
const jestMock = require("jest-mock");
const app = require("./server"); // Corrected to use 'server.js'

jest.mock("mysql2", () => {
  const mConnection = {
    connect: jest.fn().mockImplementation((cb) => cb(null)),
    query: jest.fn(),
    end: jest.fn(),
  };
  return {
    createConnection: jest.fn(() => mConnection),
  };
});

describe("Database Connection", () => {
  test("it should connect to the database without error", () => {
    expect(mysql.createConnection().connect).toHaveBeenCalled();
  });
});

describe("API endpoints", () => {
  const db = mysql.createConnection();

  beforeEach(() => {
    db.query.mockClear();
  });

  // test('GET / should respond with "Hello World!"', async () => {
  //   const response = await request(app).get("/");
  //   expect(response.text).toBe("Hello World!");
  //   expect(response.statusCode).toBe(200);
  // });

  test("GET /vehicle-types should fetch vehicle types", async () => {
    db.query.mockImplementationOnce((sql, callback) =>
      callback(null, [{ vtype: "SUV" }])
    );
    const response = await request(app).get("/vehicle-types");
    expect(response.statusCode).toBe(200);
    expect(response.body).toEqual([{ vtype: "SUV" }]);
  });

  test("GET /vehicles should fetch vehicles without reservation overlap", async () => {
    db.query.mockImplementationOnce((sql, callback) => callback(null, []));
    const response = await request(app).get("/vehicles");
    expect(response.statusCode).toBe(200);
  });

  test("GET /reservations should fetch reservation details", async () => {
    db.query.mockImplementationOnce((sql, params, callback) =>
      callback(null, [])
    );
    const response = await request(app).get("/reservations");
    expect(response.statusCode).toBe(200);
  });

  test("POST /reservations should create a reservation", async () => {
    db.query.mockImplementationOnce((sql, params, callback) =>
      callback(null, { affectedRows: 1 })
    );
    const response = await request(app).post("/reservations").send({
      customerName: "John Doe",
      customerId: "12345",
      vtype: "SUV",
      vin: "VIN12345",
      startDate: "2022-01-01",
      endDate: "2022-01-05",
    });
    expect(response.statusCode).toBe(201);
    expect(response.text).toBe("Reservation created successfully");
  });
  test("GET /vehicles should handle errors", async () => {
    // Mock the database query to simulate an error
    db.query.mockImplementationOnce((sql, callback) =>
      callback(new Error("Database error"), null)
    );

    const response = await request(app).get("/vehicles");
    expect(response.statusCode).toBe(500);
    expect(response.text).toContain("Error fetching vehicle stats");
  });
  test("DELETE /reservations/:rid should handle non-existing reservations", async () => {
    db.query.mockImplementationOnce((sql, params, callback) =>
      callback(null, { affectedRows: 0 })
    );
    const rid = "nonexistingrid";
    const response = await request(app).delete(`/reservations/${rid}`);
    expect(response.statusCode).toBe(404);
    expect(response.text).toBe("Reservation not found");
  });
  test("PUT /reservations/:rid should update a reservation", async () => {
    const rid = "exampleRid";
    const reservationData = {
      vin: "VIN12345",
      customerId: "12345",
      start_date: "2023-01-01",
      end_date: "2023-01-05",
    };

    db.query.mockImplementationOnce((sql, params, callback) =>
      callback(null, { affectedRows: 1 })
    );

    const response = await request(app)
      .put(`/reservations/${rid}`)
      .send(reservationData);

    expect(response.statusCode).toBe(200);
    expect(response.text).toBe("Reservation updated successfully");
  });

  test("PUT /reservations/:rid should return 404 for non-existing reservation", async () => {
    const rid = "nonExistingRid";
    const reservationData = {
      vin: "VIN12345",
      customerId: "12345",
      start_date: "2023-01-01",
      end_date: "2023-01-05",
    };

    db.query.mockImplementationOnce((sql, params, callback) =>
      callback(null, { affectedRows: 0 })
    );

    const response = await request(app)
      .put(`/reservations/${rid}`)
      .send(reservationData);

    expect(response.statusCode).toBe(404);
    expect(response.text).toBe("Reservation not found");
  });
  // Assuming `db` is your database connection object
});

// Include any other test cases or additional logic here

describe("/signup API endpoint", () => {
  const db = mysql.createConnection();
  test("POST /signup should create a new customer", async () => {
    // Mock the database insertion to succeed
    const mockQuery = jest
      .fn()
      .mockImplementation((sql, params, callback) =>
        callback(null, { insertId: 1 })
      );
    db.query = mockQuery;

    // Customer data to be sent in the POST request
    const customerData = {
      fname: "John",
      lname: "Doe",
      age: 30,
      email: "john.doe@example.com",
      phone: "1234567890",
      street: "123 Maple Drive",
      city: "Anytown",
      state: "Anystate",
      zipcode: "12345",
    };

    // Send POST request to /signup endpoint
    const response = await request(app).post("/signup").send(customerData);

    // Assertions to confirm the expected outcome
    expect(response.statusCode).toBe(201);
    expect(response.body).toHaveProperty("customerId");
    expect(response.body).toHaveProperty("customerName", "Doe");
    expect(mockQuery).toHaveBeenCalledWith(
      expect.stringContaining("INSERT INTO customers"),
      expect.any(Array),
      expect.any(Function)
    );
  });
});
