import Head from "next/head";
import { useState, FormEvent, ChangeEvent } from "react";
import  "../styles/ReservationSearch.module.css";
type Reservation = {
  rid: string;
  lname: string;
  fname: string;
  start_date: string;
  end_date: string;
  make: string;
  model: string;
};

export default function SearchReservation() {
  const [name, setName] = useState("");
  const [date, setDate] = useState("");
  const [reservations, setReservations] = useState<Reservation[]>([]);
  const [isLoading, setIsLoading] = useState(false);
  const [errorMessage, setErrorMessage] = useState("");

  function handleInputChange(e: ChangeEvent<HTMLInputElement>) {
    const { name, value } = e.target;
    if (name === "name") {
      setName(value);
    } else if (name === "date") {
      setDate(value);
    }
  }

  function handleSubmit(e: FormEvent) {
    e.preventDefault();
    setIsLoading(true);
    fetch(
      `http://localhost:3001/reservations?lastName=${encodeURIComponent(
        name
      )}`
    )
      .then((response) => {
        if (!response.ok) {
          throw new Error("Failed to fetch reservations");
        }
        return response.json();
      })
      .then((data) => {
        setReservations(data as Reservation[]);
        setIsLoading(false);
      })
      .catch((error) => {
        console.error("Error:", error);
        setErrorMessage("Failed to load reservations");
        setIsLoading(false);
      });
  }

  function handleModify(rid: string) {
    console.log("Modify reservation with ID:", rid);
    // Here you might navigate to a modification page or open a modal
  }

  function handleDelete(rid: string) {
    console.log("Delete reservation with ID:", rid);
    // Here you might confirm deletion and then call an API to delete the reservation
  }

  return (
    <div>
      <Head>
        <title>Search Reservation</title>
      </Head>
      <br />
      <form onSubmit={handleSubmit}>
        <div className="container">
          <div className="container search">
            <h1>Search Reservations</h1>
            <br />
            <label htmlFor="name">Name:</label>
            <br />
            <input
              type="text"
              id="name"
              name="name"
              value={name}
              onChange={handleInputChange}
              required
            />
            <br />
            <br />
            <label htmlFor="date">Date:</label>
            <br />
            <input
              type="date"
              id="date"
              name="date"
              value={date}
              onChange={handleInputChange}
            />
            <br />
            <br />
            <button type="submit" disabled={isLoading}>
              Search
            </button>
          </div>
        </div>
      </form>
      {errorMessage && <p>{errorMessage}</p>}
      <div className="results">
        <table>
          <thead>
            <tr>
              <th>Reservation ID</th>
              <th>Name</th>
              <th>Start Date</th>
              <th>End Date</th>
              <th>Make</th>
              <th>Model</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {reservations.length > 0 ? (
              reservations.map((reservation) => (
                <tr key={reservation.rid}>
                  <td>{reservation.rid}</td>
                  <td>
                    {reservation.lname} {reservation.fname}
                  </td>
                  <td>{reservation.start_date}</td>
                  <td>{reservation.end_date}</td>
                  <td>{reservation.make}</td>
                  <td>{reservation.model}</td>
                  <td>
                    <button onClick={() => handleModify(reservation.rid)}>
                      Modify
                    </button>
                    <button onClick={() => handleDelete(reservation.rid)}>
                      Delete
                    </button>
                  </td>
                </tr>
              ))
            ) : (
              <tr>
                <td>No reservations found.</td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}
