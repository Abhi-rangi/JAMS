// Import additional testing utilities as needed
import "@testing-library/jest-dom"; // Provides custom jest matchers to test the state of the DOM
import "@testing-library/react/dont-cleanup-after-each"; // Prevent automatic cleanup (optional based on your needs)
import { configure } from "@testing-library/react"; // For setting up test configurations

// Extend Jest matchers with additional functionalities
import "jest-extended"; // Optional: if you use jest-extended for additional matchers

// Optionally import fetch polyfill if your tests involve API calls and you don't use a global fetch in your environment
import "whatwg-fetch"; // Polyfills 'fetch' in the Jest Node environment

// Configure React Testing Library
// This is useful for adding custom queries or setting up defaults for your entire test suite
configure({
  throwSuggestions: true, // This makes the library throw errors for better debugging (especially useful with `findBy` queries)
});

// Add any global mocks here
// Mocking localStorage or sessionStorage
const localStorageMock = (function () {
  let store = {};
  return {
    getItem(key: string) {
      return store[key] || null;
    },
    setItem(key: string, value: any) {
      store[key] = String(value);
    },
    removeItem(key: string) {
      delete store[key];
    },
    clear() {
      store = {};
    },
  };
})();

Object.defineProperty(window, "localStorage", {
  value: localStorageMock,
});

Object.defineProperty(window, "sessionStorage", {
  value: { ...localStorageMock }, // Just cloning localStorage mock here, adjust as needed
});

// Example of how to mock a simple fetch
global.fetch = jest.fn(() =>
  Promise.resolve({
    json: () => Promise.resolve({}),
  })
) as jest.Mock;

// Setup done, you can add more mocks and configurations as needed for your project.
