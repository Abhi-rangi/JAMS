import Link from "next/link";
import Head from "next/head";

export default function Home() {
  return (
    <div className="home-container">
      <Head>
        <title>Welcome</title>
      </Head>
      <h1>Welcome to Our Service</h1>
      <div className="button-container">
        <Link href="/search" passHref>
          <button>Search</button>
        </Link>
        <Link href="/reservation" passHref>
          <button>Reservation</button>
        </Link>
        <Link href="/makereservation" passHref>
          <button>Make Reservation</button>
        </Link>
      </div>
      <style jsx>{`
        .home-container {
          text-align: center;
          margin-top: 50px;
        }
        .button-container {
          margin-top: 20px;
        }
        button {
          margin: 10px;
          padding: 10px 20px;
          font-size: 16px;
          cursor: pointer;
          background-color: #0070f3;
          color: white;
          border: none;
          border-radius: 5px;
          transition: background-color 0.3s;
        }
        button:hover {
          background-color: #0056b3;
        }
      `}</style>
    </div>
  );
}
