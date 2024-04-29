import { render, screen, fireEvent } from "@testing-library/react";
import Home from "../src/pages/index";
import "@testing-library/jest-dom";
import { useRouter } from "next/router";

// Mocking useRouter directly using TypeScript and Jest
jest.mock("next/router", () => ({
  useRouter: jest.fn(),
}));

// Define what the useRouter hook will return
const mockPush = jest.fn();

// Use a TypeScript assertion to cast the mocked useRouter
const mockedUseRouter = useRouter as jest.Mock;
mockedUseRouter.mockImplementation(() => ({
  push: mockPush,
  pathname: "/",
  query: {},
  asPath: "/",
}));

describe("Home component", () => {
  beforeEach(() => {
    // Clear mockPush function before each test
    mockPush.mockClear();
  });

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

  it("navigates to search page on search button click", () => {
    render(<Home />);
    fireEvent.click(screen.getByText("Search"));
    // Check that the push method was called with the correct path
    expect(mockPush).toHaveBeenCalledWith("/search");
  });

  it("navigates to reservation page on reservation button click", () => {
    render(<Home />);
    fireEvent.click(screen.getByText("Reservation"));
    expect(mockPush).toHaveBeenCalledWith("/reservation");
  });

  it("navigates to make reservation page on make reservation button click", () => {
    render(<Home />);
    fireEvent.click(screen.getByText("Make Reservation"));
    expect(mockPush).toHaveBeenCalledWith("/makereservation");
  });
});
