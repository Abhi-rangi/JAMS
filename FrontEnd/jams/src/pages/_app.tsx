// pages/_app.tsx
import "../styles/Search_available.css";
import { AppProps } from "next/app";
import Navbar from "../components/Navbar";
function MyApp({ Component, pageProps }: AppProps) {
  return (
    <>
    <Navbar></Navbar>
      <Component {...pageProps} />
    </>
  );
}

export default MyApp;
