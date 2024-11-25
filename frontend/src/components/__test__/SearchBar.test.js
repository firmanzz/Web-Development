import { render, screen, fireEvent } from "@testing-library/react";
import SearchBar from "../SearchBar";

describe("SearchBar Component", () => {
  test("renders search input field", () => {
    render(
      <SearchBar
        searchQuery=""
        setSearchQuery={jest.fn()}
        handleSearchSubmit={jest.fn()}
      />
    );

    // Verify that the search input is rendered
    const searchInput = screen.getByPlaceholderText(/search.../i);
    expect(searchInput).toBeInTheDocument();
  });

  test("updates search query on user input", () => {
    const setSearchQueryMock = jest.fn();
    render(
      <SearchBar
        searchQuery=""
        setSearchQuery={setSearchQueryMock}
        handleSearchSubmit={jest.fn()}
      />
    );

    // Simulate user input
    const searchInput = screen.getByPlaceholderText(/search.../i);
    fireEvent.change(searchInput, { target: { value: "action" } });

    // Verify that the mock function is called with the updated value
    expect(setSearchQueryMock).toHaveBeenCalledWith("action");
  });

  test("triggers search submit on Enter key", () => {
    const handleSearchSubmitMock = jest.fn();
    render(
      <SearchBar
        searchQuery="action"
        setSearchQuery={jest.fn()}
        handleSearchSubmit={handleSearchSubmitMock}
      />
    );

    // Simulate pressing the Enter key
    const searchInput = screen.getByPlaceholderText(/search.../i);
    fireEvent.keyDown(searchInput, { key: "Enter", code: "Enter" });

    // Verify that the submit handler is called
    expect(handleSearchSubmitMock).toHaveBeenCalled();
  });
});
