import Head from "next/head";
import { useState, FormEvent, ChangeEvent } from "react";
import { useRouter } from "next/router";

type Customer = {
  cid: string;
  fname: string;
  lname: string;
  email: string;
  phone: string;
  age: number;
};

export default function SearchCustomer() {
  const router = useRouter();
  const [customers, setCustomers] = useState<Customer[]>([]);
  const [searchParams, setSearchParams] = useState({
    lname: "",
    cid: "",
  });
  const [searched, setSearched] = useState(false); // New state to track if search was performed

  function handleInputChange(e: ChangeEvent<HTMLInputElement>) {
    const { name, value } = e.target;
    setSearchParams((prev) => ({ ...prev, [name]: value }));
  }

  function handleSubmit(e: FormEvent) {
    e.preventDefault();
    setSearched(true); // Set to true when search is performed
    const query = new URLSearchParams(searchParams as any).toString();
    fetch(`http://localhost:3001/customers?${query}`)
      .then((response) => response.json())
      .then((data) => {
        setCustomers(data); // Assume data is already an array
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
        setCustomers([]); // Reset customers on error
      });
  }

  function handleViewDetails(customer: Customer) {
    // Redirect to /search with customer details
    router.push({
      pathname: "/search",
      query: { customer: JSON.stringify(customer) },
    });
  }
  function handleSignUp() {
    router.push("/signup"); // Navigate to signup page
  }

  return (
    <div>
      <Head>
        <title>Search Customer</title>
      </Head>
      <br />
      <form onSubmit={handleSubmit}>
        <div className="container">
          <div className="container search">
            <h1>Search for a customer</h1>
            <br />
            <label htmlFor="lname">Last Name</label>
            <br />
            <input
              type="text"
              id="lname"
              name="lname"
              value={searchParams.lname}
              onChange={handleInputChange}
            />
            <br />
            <br />
            <label htmlFor="cid">Customer ID</label>
            <br />
            <input
              type="text"
              id="cid"
              name="cid"
              value={searchParams.cid}
              onChange={handleInputChange}
            />
            <br />
            <br />
            <button type="submit" value="Search">
              Search
            </button>
            <hr/>
            <button type="button" onClick={handleSignUp}>
              Sign Up New Customer
            </button>
          </div>
        </div>
      </form>
      <div className="results">
        {searched && customers.length === 0 && (
          <p>No customers found. Please adjust your search criteria.</p>
        )}
        {customers.length > 0 && (
          <table>
            <thead>
              <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Age</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {customers.map((customer) => (
                <tr key={customer.cid}>
                  <td>{customer.cid}</td>
                  <td>{customer.fname}</td>
                  <td>{customer.lname}</td>
                  <td>{customer.age}</td>
                  <td>{customer.email}</td>
                  <td>{customer.phone}</td>

                  <td>
                    <button onClick={() => handleViewDetails(customer)}>
                      Select
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>
      <style jsx>{`
        hr {
          border: 0; /* Remove the default border */
          height: 1px; /* Set the height of the HR */
          background-color: #ccc; /* Change the color of the HR */
          margin: 20px 0; /* Add some space above and below the HR */
          border-top: 8px double #999;
          
        }
      `}</style>
      ;
    </div>
  );
}
