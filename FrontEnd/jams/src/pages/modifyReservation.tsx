import { useState, useEffect, FormEvent, ChangeEvent } from "react";
import Head from "next/head";
import router from "next/router";

type FormValues = {
  customerName: string;
  customerId: string;
  vtype: string;
  vin: string;
  startDate: string;
  endDate: string;
};

export default function ModifyReservation() {
  const [formValues, setFormValues] = useState<FormValues>({
    customerId: "",
    customerName: "",
    vtype: "",
    vin: "",
    startDate: "",
    endDate: "",
  });

  useEffect(() => {
    // Assuming 'rid' is fetched from the router query params in Next.js
    const rid = router.query.rid;
    console.log(rid);
    if (rid) {
      fetch(`http://localhost:3001/reservations/${rid}`)
        .then((response) => {
          if (!response.ok) {
            throw new Error("Failed to fetch reservation details");
          }
          return response.json();
        })
        .then((data) => {
          setFormValues({
            vin: data.vin,
            vtype: data.vtype,
            startDate: formatDateForInput(data.startDate),
            endDate: formatDateForInput(data.endDate),
            customerName: data.customerName,
            customerId: data.customerId,
          });
        })
        .catch((error) => {
          console.error("Error fetching reservation details:", error);
          // Handle errors here, such as showing a notification or error message
        });
    }
  }, [])

  function handleInputChange(e: ChangeEvent<HTMLInputElement>) {
    const { name, value } = e.target;
    setFormValues((prevValues) => ({
      ...prevValues,
      [name]: value,
    }));
  }

  function handleSubmit(e: FormEvent) {
    e.preventDefault();
    const rid  = router.query.rid;

    // API endpoint where the reservation is updated
    const apiUrl = `http://localhost:3001/reservations/${rid}`;

    // Prepare the data for the PUT request
    const data = {
      vin: formValues.vin,
      customerId: formValues.customerId,
      start_date: formValues.startDate,
      end_date: formValues.endDate,
    };

    fetch(apiUrl, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(data),
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error("Failed to update reservation");
        }
        console.log("Reservation updated successfully:", data);
        alert("Reservation updated successfully:");
        // Redirect to the reservation page or success page
        router.push("/reservation");
        return response.json();
      })
      .then((data) => {
        console.log(data);
      })
      .catch((error) => {
        console.error("Error updating reservation:", error);
        // Handle errors here, such as displaying an error message to the user
      });
    // Redirecting to a success page or another route
  }
function formatDateForInput(dateString: string): string {
  const date = new Date(dateString);
  return date.toISOString().split("T")[0]; // This will format the date as "YYYY-MM-DD"
}
  return (
    <div className="vehicle-form-container">
      <Head>
        <title>Modify Reservation</title>
      </Head>
      <br />
      <form onSubmit={handleSubmit}>
        <div className="container">
          <div className="container search">
            <h1>Modify Vehicle Reservation</h1>
            <label htmlFor="customerName">Customer Name:</label>
            <input
              type="text"
              id="customerName"
              name="customerName"
              value={formValues.customerName}
              onChange={handleInputChange}
              required
              readOnly
            />
            <br />
            <br />
            <label htmlFor="customerId">Customer ID:</label>
            <input
              type="text"
              id="customerId"
              name="customerId"
              value={formValues.customerId}
              onChange={handleInputChange}
              required
              readOnly
            />
            <br />
            <br />
            <label htmlFor="vtype">Vehicle Type:</label>
            <input
              type="text"
              id="vtype"
              name="vtype"
              value={formValues.vtype}
              onChange={handleInputChange}
              required
            />
            <br />
            <br />
            <label htmlFor="vin">VIN:</label>
            <input
              type="text"
              id="vin"
              name="vin"
              value={formValues.vin}
              onChange={handleInputChange}
              required
            />
            <br />
            <br />
            <label htmlFor="startDate">Start Date:</label>
            <input
              type="date"
              id="startDate"
              name="startDate"
              value={formValues.startDate}
              onChange={handleInputChange}
              required
            />
            <br />
            <br />
            <label htmlFor="endDate">End Date:</label>
            <input
              type="date"
              id="endDate"
              name="endDate"
              value={formValues.endDate}
              onChange={handleInputChange}
              required
            />
            <br />
            <br />
            <button type="submit">Submit</button>
          </div>
        </div>
      </form>
    </div>
  );
}
