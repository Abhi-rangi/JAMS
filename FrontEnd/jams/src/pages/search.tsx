import Head from "next/head";
import { useState, useEffect, FormEvent, ChangeEvent } from "react";
import router, { useRouter } from "next/router";
type VehicleType = {
  vtype: string;
};

type Vehicle = {
  vin: string;
  make: string;
  model: string;
  seating: number;
  mpg: string;
  vtype: string;
  startDate?: string;
  endDate?: string;
};
type Customer = {
  cid: string;
  fname: string;
  lname: string;
  email: string;
  phone: string;
  age: number;
};
export default function Search() {
  const [vehicleTypes, setVehicleTypes] = useState<VehicleType[]>([]);
  const [vehicles, setVehicles] = useState<Vehicle[]>([]);
  const [searchParams, setSearchParams] = useState({
    startDate: "",
    endDate: "",
    vtype: "",
  });

  useEffect(() => {
    // Simulate fetching vehicle types, you should replace the URL with your actual API endpoint
    fetch("http://localhost:3001/vehicle-types")
      .then((response) => response.json())
      .then((data) => setVehicleTypes(data as VehicleType[]))
      .catch(console.error);
  }, []);

  function handleInputChange(
    e: ChangeEvent<HTMLInputElement | HTMLSelectElement>
  ) {
    const { name, value } = e.target;
    setSearchParams((prev) => ({ ...prev, [name]: value }));
  }

  function handleSubmit(e: FormEvent) {
    e.preventDefault();
    const query = new URLSearchParams(searchParams as any).toString();
    const { startDate, endDate } = searchParams;

    // Validate start date is less than end date
    if (new Date(startDate) >= new Date(endDate)) {
      alert("End date must be greater than start date");
      return; // Prevent form submission
    }
    fetch(`http://localhost:3001/vehicles?${query}`)
      .then((response) => response.json())
      .then((data) => {
        if (Array.isArray(data)) {
          // Check if the response is an array
          setVehicles(data as Vehicle[]);
        } else {
          throw new Error("Data is not an array");
        }
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
        setVehicles([]); // Reset vehicles on error
      });
  }
  function selectVehicleForReservation(vehicle: Vehicle) {
    localStorage.setItem("vehicleDetails", JSON.stringify(vehicle));
    // navigate to the reservation page
  }
  function handleMakeReservation(vehicle: Vehicle) {
    // Here you can navigate to a reservation page with the vehicle data
    const startDateElement = document.getElementById(
      "startDate"
    ) as HTMLInputElement;
    const endDateElement = document.getElementById(
      "endDate"
    ) as HTMLInputElement;

    if (startDateElement && startDateElement.value) {
      vehicle.startDate = startDateElement.value;
    }

    if (endDateElement && endDateElement.value) {
      vehicle.endDate = endDateElement.value;
    }
    let vin = vehicle.vin;
    let vtype = vehicle.vtype;
    let startDate = vehicle.startDate;
    let endDate = vehicle.endDate;

    selectVehicleForReservation(vehicle);
    router.push({
      pathname: "/makereservation",
      query: {vin,vtype,startDate,endDate},
    });
  }

  const { customer } = router.query;
  let customerDetails = {};
  if (typeof customer === "string") {
    try {
      customerDetails = JSON.parse(decodeURIComponent(customer)) as {
        [key: string]: any;
      };
    } catch (error) {
      console.error("Error parsing customer details:", error);
      // Handle parsing error (e.g., display an error message)
    }
  }
  return (
    <div>
      <Head>
        <title>Search Vehicle</title>
      </Head>
      <br />
      <form onSubmit={handleSubmit}>
        <div className="container">
          <div className="container search">
            <h1>Search for a vehicle</h1>
            {customerDetails &&
              Object.entries(customerDetails).map(([key, value]) => (
                <div key={key}>
                  <label>{key.charAt(0).toUpperCase() + key.slice(1)}:</label>
                  <input
                    type="text"
                    value={value ? value.toString() : ""}
                    readOnly
                  />
                </div>
              ))}
            <label htmlFor="startDate">Pick-up Date</label>
            <input
              type="date"
              id="startDate"
              name="startDate"
              required
              onChange={handleInputChange}
            />
            <br />
            <br />
            <label htmlFor="endDate">Drop-off Date</label>
            <input
              type="date"
              id="endDate"
              name="endDate"
              required
              onChange={handleInputChange}
            />
            <br />
            <br />
            <label htmlFor="vtype">Vehicle Type</label>
            <select id="vtype" name="vtype" onChange={handleInputChange}>
              <option value="" disabled selected>
                Select a Vehicle Type
              </option>
              {vehicleTypes.map((type) => (
                <option key={type.vtype} value={type.vtype}>
                  {type.vtype}
                </option>
              ))}
            </select>
            <br />
            <br />
            <button type="submit" value="Search">
              Search
            </button>
          </div>
        </div>
      </form>
      <div className="results">
        <table>
          <thead>
            <tr>
              <th>VIN</th>
              <th>Make</th>
              <th>Model</th>
              <th>Seating</th>
              <th>MPG</th>
              <th>Type</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {vehicles.map((vehicle) => (
              <tr key={vehicle.vin}>
                <td>{vehicle.vin}</td>
                <td>{vehicle.make}</td>
                <td>{vehicle.model}</td>
                <td>{vehicle.seating}</td>
                <td>{vehicle.mpg}</td>
                <td>{vehicle.vtype}</td>
                <td>
                  <button onClick={() => handleMakeReservation(vehicle)}>
                    Make Reservation
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
      <style jsx>{`
        div {
          margin-bottom: 10px;
        }
        label {
          margin-right: 10px;
        }
        input {
          border: 1px solid #ccc;
          border-radius: 4px;
          padding: 8px;
          width: 200px;
        }
      `}</style>
      ;
    </div>
  );
}
