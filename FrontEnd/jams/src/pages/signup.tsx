import router from "next/router";
import { useState, useEffect, FormEvent, ChangeEvent } from "react";

export default function Register() {
  const [fname, setFname] = useState("");
  const [lname, setLname] = useState("");
  const [email, setEmail] = useState("");
  const [age, setAge] = useState("");
  const [phone, setPhone] = useState("");
  const [street, setStreet] = useState("");
  const [city, setCity] = useState("");
  const [state, setState] = useState("");
  const [zipcode, setZipcode] = useState("");
const handleSubmit = async (e: React.FormEvent) => {
  e.preventDefault();
  // Assuming `fname`, `lname`, `email`, `age`, `phone`, `street`, `city`, `state`, and `zipcode`
  // are defined somewhere in your component as state variables.

  // Construct the body of the request
  const body = {
    fname,
    lname,
    email,
    age,
    phone,
    street,
    city,
    state,
    zipcode,
  };

  // Send the POST request
  try {
    const response = await fetch("http://localhost:3001/signup", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(body),
    });

    if (!response.ok) {
      throw new Error("Failed to sign up");
    }
    const result = await response.json(); // or response.json() if server responds with JSON
    console.log("Sign up created successfully:", result);
    alert("Sign up created successfully!");
  // console.log(response.json);
    localStorage.setItem("customer", JSON.stringify(result))
    // router.push("/search");

     router.push({
       pathname: "/search",
       query: { customer: JSON.stringify(result) },
     });

  } catch (error) {
    console.error("Error during sign up:", error);
    alert("Error during sign up.");
  }
};

  return (
    <div className="container">
      <div className="container search">
        <h1>Sign Up</h1>
        <form onSubmit={handleSubmit}>
          <label htmlFor="fname">First Name</label>
          <input
            name="fname"
            value={fname}
            placeholder="First Name"
            onChange={(e) => setFname(e.target.value)}
          />
          <br></br>
          <br></br>
          <label htmlFor="lname">Last Name</label>
          <input
            name="lname"
            value={lname}
            placeholder="Last Name"
            onChange={(e) => setLname(e.target.value)}
          />
          <br></br>
          <br></br>
          <label htmlFor="email">Email</label>
          <input
            name="email"
            value={email}
            placeholder="Email"
            onChange={(e) => setEmail(e.target.value)}
          />
          <br></br>
          <br></br>
          <label htmlFor="age">Age</label>
          <input
            name="age"
            value={age}
            placeholder="Age"
            onChange={(e) => setAge(e.target.value)}
          />
          <br></br>
          <br></br>
          <label htmlFor="phone">Phone</label>
          <input
            name="phone"
            value={phone}
            placeholder="Phone"
            onChange={(e) => setPhone(e.target.value)}
          />
          <br></br>
          <br></br>
          <label htmlFor="streeet">Street</label>
          <input
            name="street"
            value={street}
            placeholder="Street"
            onChange={(e) => setStreet(e.target.value)}
          />
          <br></br>
          <br></br>
          <label htmlFor="city">City</label>
          <input
            name="city"
            value={city}
            placeholder="City"
            onChange={(e) => setCity(e.target.value)}
          />
          <br></br>
          <br></br>
          <label htmlFor="state">State</label>
          <input
            name="state"
            value={state}
            placeholder="State"
            onChange={(e) => setState(e.target.value)}
          />
          <br></br>
          <br></br>
          <label htmlFor="zipcode">Zip Code</label>
          <input
            name="zipcode"
            value={zipcode}
            placeholder="Zipcode"
            onChange={(e) => setZipcode(e.target.value)}
          />
          <br></br>
          <br></br>
          <button type="submit">Submit</button>
        </form>
      </div>
    </div>
  );
}
