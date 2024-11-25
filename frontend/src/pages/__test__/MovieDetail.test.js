import React from "react";
import { render, screen, fireEvent, waitFor } from "@testing-library/react";
import { MemoryRouter, Route, Routes } from "react-router-dom";
import Cookies from "js-cookie";
import MovieDetail from "../MovieDetail";

// Mock fetch API
global.fetch = jest.fn();

describe("MovieDetail Component", () => {
  beforeEach(() => {
    jest.clearAllMocks();
    Cookies.get = jest.fn();
  });

  test("renders loading state initially", () => {
    render(
      <MemoryRouter initialEntries={["/movies/1/detail"]}>
        <Routes>
          <Route path="/movies/:id/detail" element={<MovieDetail />} />
        </Routes>
      </MemoryRouter>
    );

    expect(screen.getByText(/Loading movie details.../i)).toBeInTheDocument();
  });

  test("renders error state if API call fails", async () => {
    fetch.mockRejectedValueOnce(new Error("API is down"));

    render(
      <MemoryRouter initialEntries={["/movies/1/detail"]}>
        <Routes>
          <Route path="/movies/:id/detail" element={<MovieDetail />} />
        </Routes>
      </MemoryRouter>
    );

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

    render(
      <MemoryRouter initialEntries={["/movies/1/detail"]}>
        <Routes>
          <Route path="/movies/:id/detail" element={<MovieDetail />} />
        </Routes>
      </MemoryRouter>
    );

    await waitFor(() =>
      expect(screen.getByText(/Mock Movie/i)).toBeInTheDocument()
    );
    expect(screen.getByText(/Action/i)).toBeInTheDocument();
    expect(screen.getByText(/Netflix/i)).toBeInTheDocument();
    expect(screen.getByText(/Best Picture/i)).toBeInTheDocument();
  });

  test("renders login button if user is not logged in", async () => {
    Cookies.get.mockReturnValue(null);

    render(
      <MemoryRouter initialEntries={["/movies/1/detail"]}>
        <Routes>
          <Route path="/movies/:id/detail" element={<MovieDetail />} />
        </Routes>
      </MemoryRouter>
    );

    await waitFor(() =>
      expect(
        screen.getByText(/Login untuk menambahkan review/i)
      ).toBeInTheDocument()
    );
  });

  test("allows submitting a new review when logged in", async () => {
    Cookies.get.mockReturnValue("mock-token");

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

    fetch
      .mockResolvedValueOnce({
        ok: true,
        json: async () => mockMovieData,
      })
      .mockResolvedValueOnce({
        ok: true,
        json: async () => ({
          message: "Review submitted successfully",
          comment: { id: 1, comment: "Great movie!", rate: 5 },
        }),
      });

    render(
      <MemoryRouter initialEntries={["/movies/1/detail"]}>
        <Routes>
          <Route path="/movies/:id/detail" element={<MovieDetail />} />
        </Routes>
      </MemoryRouter>
    );

    await waitFor(() =>
      expect(screen.getByText(/Mock Movie/i)).toBeInTheDocument()
    );

    const ratingInput = screen.getByLabelText(/Rating \(1-10\):/i);
    const commentInput = screen.getByLabelText(/Comment:/i);
    const submitButton = screen.getByText(/Submit Review/i);

    fireEvent.change(ratingInput, { target: { value: 5 } });
    fireEvent.change(commentInput, { target: { value: "Great movie!" } });
    fireEvent.click(submitButton);

    await waitFor(() =>
      expect(
        screen.getByText(/Review submitted successfully/i)
      ).toBeInTheDocument()
    );
  });
});
