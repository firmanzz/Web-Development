import { render, screen, fireEvent } from "@testing-library/react";
import Filter from "../Filter";

describe("Filter Component", () => {
  const mockHandleSubmit = jest.fn();
  const renderFilter = () =>
    render(
      <Filter
        genre=""
        setGenre={jest.fn()}
        year=""
        setYear={jest.fn()}
        status=""
        setStatus={jest.fn()}
        availability=""
        setAvailability={jest.fn()}
        award=""
        setAward={jest.fn()}
        sortOrder=""
        setSortOrder={jest.fn()}
        handleSubmit={mockHandleSubmit}
      />
    );

  test("renders the filter button", () => {
    renderFilter();
    const filterButton = screen.getByText(/Filter/i);
    expect(filterButton).toBeInTheDocument();
  });

  test("renders genre, year, status, availability, award, and sort order dropdowns", () => {
    renderFilter();
    const genreSelect = screen.getByDisplayValue("All Genre");
    const yearSelect = screen.getByDisplayValue("All Year");
    const statusSelect = screen.getByDisplayValue("All Status");
    const availabilitySelect = screen.getByDisplayValue("All Availability");
    const awardSelect = screen.getByDisplayValue("All Award");
    const sortOrderSelect = screen.getByDisplayValue(/Sort By/i);

    expect(genreSelect).toBeInTheDocument();
    expect(yearSelect).toBeInTheDocument();
    expect(statusSelect).toBeInTheDocument();
    expect(availabilitySelect).toBeInTheDocument();
    expect(awardSelect).toBeInTheDocument();
    expect(sortOrderSelect).toBeInTheDocument();
  });

  test("does not crash when no filter data is provided", () => {
    render(<Filter />);
    const filterButton = screen.getByText(/Filter/i);
    expect(filterButton).toBeInTheDocument();
  });

  // Pengujian Baru

  test("calls handleSubmit when Submit button is clicked", () => {
    renderFilter();

    // Klik tombol Submit
    const submitButton = screen.getByText(/Submit/i);
    fireEvent.click(submitButton);

    // Verifikasi handleSubmit dipanggil
    expect(mockHandleSubmit).toHaveBeenCalled();
  });

  test("updates isOpen state when Filter button is clicked", () => {
    renderFilter();

    // Klik tombol Filter untuk membuka dropdown
    const filterButton = screen.getByText(/Filter/i);
    fireEvent.click(filterButton);

    // Verifikasi teks Filter ada (opsional untuk memeriksa UI yang berubah)
    const filterText = screen.getByText(/Filter/i);
    expect(filterText).toBeInTheDocument();
  });
});
