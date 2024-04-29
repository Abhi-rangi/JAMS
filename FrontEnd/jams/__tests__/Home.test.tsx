/**
 * @jest-environment jsdom
 */


import { render, screen } from "@testing-library/react";
import Home from "../src/pages/index";
import "@testing-library/jest-dom";
import { describe, expect, test ,it} from "@jest/globals";
import "@testing-library/jest-dom/jest-globals";
import {fireEvent } from "@testing-library/react";
import { useRouter } from "next/router";

// Mock the Next.js router
jest.mock("next/router", () => ({
  useRouter: jest.fn(),
}));


describe("Home component", () => {
  it("renders correctly", () => {
    render(<Home />);
    expect(screen.getByText("Welcome to Our Service")).toBeInTheDocument();
    expect(screen.getByRole("button", { name: "Search" })).toBeInTheDocument();
    expect(
      screen.getByRole("button", { name: "Reservation" })
    ).toBeInTheDocument();
    expect(
      screen.getByRole("button", { name: "Make Reservation" })
    ).toBeInTheDocument();
  });
})


// describe("navigates to search", () => {
//   it("navigates to search page on search button click", () => {
//     const pushMock = jest.fn();
//     useRouter.mockImplementation(() => ({
//       push: pushMock,
//     }));

//     render(<Home />);
//     fireEvent.click(screen.getByText("Search"));
//     expect(pushMock).toHaveBeenCalledWith("/search");
//   });
// });;

// import { render, screen } from '@testing-library/react';
// // Your test cases here

// import Home from "../src/pages/index";
// import "@testing-library/jest-dom";
// // import "@testing-library/jest-dom";

// import { describe, expect, test ,it} from "@jest/globals";

// import {fireEvent } from "@testing-library/react";

// // import Home from "../path/to/Home"; // Adjust the import path as necessary
// import "@testing-library/jest-dom/jest-globals";
// // import "@testing-library/jest-dom";

// // describe("Home component", () => {
// //   it("renders correctly", () => {
// //     render(<Home />);
// //     expect(screen.getByText("Welcome to Our Service")).toBeInTheDocument();
// //     expect(screen.getByRole("button", { name: "Search" })).toBeInTheDocument();
// //     expect(
// //       screen.getByRole("button", { name: "Reservation" })
// //     ).toBeInTheDocument();
// //     expect(
// //       screen.getByRole("button", { name: "Make Reservation" })
// //     ).toBeInTheDocument();
// //   });

// //   it("navigates to search page on search button click", () => {
// //     render(<Home/>);
// //     fireEvent.click(screen.getByText("Search"));
// //     // Assuming your routing changes the URL appropriately
// //     // This is a simplistic check, in a real test you might mock router context or observe effects
// //     expect(global.window.location.href).toContain("/search");
// //   });

// //   it("navigates to reservation page on reservation button click", () => {
// //     render(<Home />);
// //     fireEvent.click(screen.getByText("Reservation"));
// //     expect(global.window.location.href).toContain("/reservation");
// //   });

// //   it("navigates to make reservation page on make reservation button click", () => {
// //     render(<Home />);
// //     fireEvent.click(screen.getByText("Make Reservation"));
// //     expect(global.window.location.href).toContain("/makereservation");
// //   });

// //   // it("buttons have correct initial styling", () => {
// //   //   render(<Home />);
// //   //   const button = screen.getByText("Search");
// //   //   expect(button).toHaveStyle("background-color: #0070f3");
// //   //   expect(button).toHaveStyle("color: white");
// //   // });

// //   // it("button hover changes background color", () => {
// //   //   render(<Home />);
// //   //   const button = screen.getByText("Search");
// //   //   fireEvent.mouseOver(button);
// //   //   // Assuming you have a way to simulate hover, you would check the style change here
// //   //   // This often requires custom implementation or additional testing environment setup
// //   //   // For example:
// //   //   // expect(button).toHaveStyle('background-color: #0056b3');
// //   // });
// // });
