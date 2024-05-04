import { useRouter } from 'next/router';
import Customer from './customer';

type Customer = {
  cid: string;
  fname: string;
  lname: string;
  email: string;
  phone: string;
};
const CustomerDetails = () => {
    const router = useRouter();
    const { customer } = router.query; 

    let customerDetails = null;
    if (typeof customer === "string") {
      customerDetails = JSON.parse(customer);
    }
    return (
        <div>
            <h1>Customer Details</h1>
            {customerDetails ? (
                <ul>
                    <li>ID: {customerDetails.cid}</li>
                    <li>Name: {customerDetails.fname} {customerDetails.lname}</li>
                    <li>Email: {customerDetails.email}</li>
                    <li>Phone: {customerDetails.phone}</li>
                </ul>
            ) : (
                <p>No customer details available. Please go back and select a customer.</p>
            )}
        </div>
    );
};

export default CustomerDetails;
