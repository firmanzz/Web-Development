import { render, screen } from "@testing-library/react";
import App from "./App";

test("renders the MasterFilm header", () => {
  render(<App />);
  const headerElement = screen.getByText(/MasterFilm/i);
  expect(headerElement).toBeInTheDocument();
});