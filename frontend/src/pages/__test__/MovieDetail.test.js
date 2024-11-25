import React from "react";
import { render, screen, fireEvent, waitFor, act } from "@testing-library/react";
import { MemoryRouter, Route, Routes } from "react-router-dom";
import Cookies from "js-cookie";
import MovieDetail from "../MovieDetail";

// Mock fetch API
global.fetch = jest.fn();
global.alert = jest.fn(); // Mock alert to avoid "not implemented" error
delete window.location;
window.location = { reload: jest.fn() }; // Mock reload

jest.mock("../../components/Sidebar", () => () => <div>Mock Sidebar</div>);
jest.mock("../../components/Header", () => () => <div>Mock Header</div>);
jest.mock("../../components/Footer", () => () => <div>Mock Footer</div>);

describe("MovieDetail Component", () => {
  beforeEach(() => {
    jest.clearAllMocks();
    Cookies.get = jest.fn();
  });

  test("renders error state if API call fails", async () => {
    fetch.mockRejectedValueOnce(new Error("API is down"));

    await act(async () => {
      render(
        <MemoryRouter initialEntries={["/movies/1/detail"]}>
          <Routes>
            <Route path="/movies/:id/detail" element={<MovieDetail />} />
          </Routes>
        </MemoryRouter>
      );
    });

    await waitFor(() =>
      expect(
        screen.getByText(/Failed to load movie data. Please try again later./i)
      ).toBeInTheDocument()
    );
  });

  test("renders movie details when API call is successful", async () => {
    const mockMovieData = {
      title: "Mock Movie",
      urlphoto: "mock-image.jpg",
      linktrailer: "https://www.youtube.com/watch?v=mock-trailer",
      releasedate: "2024-01-01",
      duration: 120,
      synopsis: "This is a mock movie",
      rating: 8.5,
      Genres: [{ name: "Action" }],
      Availabilities: [{ name: "Netflix" }],
      Awards: [{ award: "Best Picture", year: 2024 }],
      Comments: [],
    };

    fetch.mockResolvedValueOnce({
      ok: true,
      json: async () => mockMovieData,
    });

    await act(async () => {
      render(
        <MemoryRouter initialEntries={["/movies/1/detail"]}>
          <Routes>
            <Route path="/movies/:id/detail" element={<MovieDetail />} />
          </Routes>
        </MemoryRouter>
      );
    });

    await waitFor(() =>
      expect(screen.getByText("Mock Movie")).toBeInTheDocument()
    );
    expect(screen.getByText(/Action/i)).toBeInTheDocument();
    expect(screen.getByText(/Netflix/i)).toBeInTheDocument();
    expect(screen.getByText(/Best Picture/i)).toBeInTheDocument();
  });
});
