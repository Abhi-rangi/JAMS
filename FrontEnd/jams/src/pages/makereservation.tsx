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

export default function MakeReservation() {
  const [formValues, setFormValues] = useState<FormValues>({
    customerId: "",
    customerName: "",
    vtype: "",
    vin: "",
    startDate: "",
    endDate: "",

  });

  // Load vehicle details from local storage when the component mounts
  useEffect(() => {
    const storedVehicleDetails = localStorage.getItem("vehicleDetails");
    if (storedVehicleDetails) {
      const { vin, vtype, startDate, endDate } = JSON.parse(storedVehicleDetails);
      setFormValues((prevValues) => ({
        ...prevValues,
        vtype,
        vin,
        startDate,
        endDate
      }));
    }
    // else{
    //     console.log("Data Not Found!!")
    // }
  }, []);

  function handleInputChange(e: ChangeEvent<HTMLInputElement>) {
    const { name, value } = e.target;
    setFormValues((prevValues) => ({
      ...prevValues,
      [name]: value,
    }));
  }

  function handleSubmit(e: FormEvent) {
    e.preventDefault();
    console.log("Form Submitted with these values:", formValues);
    // Add API call or further processing here
    // Make POST request to server
    fetch("http://localhost:3001/reservations", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formValues),
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error("Failed to create reservation");
        }
        console.log("Reservation created successfully");
         const { customerName, vtype, vin, startDate, endDate } = formValues;
         const message = `Reservation created successfully!\nDetails:\nCustomer: ${customerName}\nVehicle Type: ${vtype}\nVehicle ID: ${vin}\nStart Date: ${startDate}\nEnd Date: ${endDate}`;

         // Show success alert
         alert(message);
         localStorage.removeItem("vehicleDetails");
         router.push("/");
        // Handle success response
      })
      .catch((error) => {
        console.error("Error creating reservation:", error);
        // Handle error
      });
  }

    return (
      <div className="vehicle-form-container">
        <Head>
          <title>Make Reservation</title>
        </Head>
        <br />
        <form onSubmit={handleSubmit}>
          <div className="container">
            <div className="container search">
              <h1>Make Vehicle Reservation</h1>
              <label htmlFor="customerName">Customer Name:</label>
              <input
                type="text"
                id="customerName"
                name="customerName"
                value={formValues.customerName}
                onChange={handleInputChange}
                required
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
              />
              <br />
              <br />
              <label htmlFor="vehicleType">Vehicle Type:</label>
              <input
                type="text"
                id="vehicleType"
                name="vehicleType"
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

//......AbortController....................................................................................................................
// import { useState, FormEvent, ChangeEvent } from "react";
// import Head from "next/head";

// type FormValues = {
//   customerName: string;
//   customerId: string;
//   vehicleType: string;
//   vin: string;
// };

// export default function MakeReservation() {

//   const [formValues, setFormValues] = useState<FormValues>({
//     customerName: "",
//     customerId: "",
//     vehicleType: "",
//     vin: "",
//   });

//   function handleInputChange(e: ChangeEvent<HTMLInputElement>) {
//     const { name, value } = e.target;
//     setFormValues((prevValues) => ({
//       ...prevValues,
//       [name]: value,
//     }));
//   }

//   function handleSubmit(e: FormEvent) {
//     e.preventDefault();
//     console.log("Form Submitted with these values:", formValues);
//     // Here you can add further logic to handle the submission, like sending data to a server.
//   }

//   return (
//     <div className="vehicle-form-container">
//       <Head>
//         <title>Search Reservation</title>
//       </Head>
//       <br />
//       <form onSubmit={handleSubmit}>
//         <div className="container">
//           <div className="container search">
//             <h1>Vehicle Information Form</h1>
//             <label htmlFor="customerName">Customer Name:</label>
//             <input
//               type="text"
//               id="customerName"
//               name="customerName"
//               value={formValues.customerName}
//               onChange={handleInputChange}
//               required
//             />
//             <br />
//             <br />
//             <label htmlFor="customerId">Customer ID:</label>
//             <input
//               type="text"
//               id="customerId"
//               name="customerId"
//               value={formValues.customerId}
//               onChange={handleInputChange}
//               required
//             />
//             <br />
//             <br />
//             <label htmlFor="vehicleType">Vehicle Type:</label>
//             <input
//               type="text"
//               id="vehicleType"
//               name="vehicleType"
//               value={formValues.vehicleType}
//               onChange={handleInputChange}
//               required
//             />
//             <br />
//             <br />
//             <label htmlFor="vin">VIN:</label>
//             <input
//               type="text"
//               id="vin"
//               name="vin"
//               value={formValues.vin}
//               onChange={handleInputChange}
//               required
//             />
//             <br />
//             <br />
//             <button type="submit">Submit</button>
//           </div>
//         </div>
//       </form>
//     </div>
//   );
// }
