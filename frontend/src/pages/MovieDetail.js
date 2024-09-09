import React from 'react';
import Sidebar from '../components/Sidebar';
import Header from '../components/Header';
import Footer from '../components/Footer';

const MovieDetail = ({ onBackClick }) => {
  return (
    <div className="flex flex-col min-h-screen">
      <Header />
      <div className="flex flex-grow">
        <Sidebar />
        <div className="flex-grow bg-gray-800">
          <div
            className="relative bg-cover bg-center bg-no-repeat"
            style={{
              backgroundImage: 'url(http://localhost:5000/uploads/shawshank_poster.jpg)',
            }}
          >
            {/* Full-Screen Background Image with Blur Overlay */}
            <div
              className="fixed top-0 left-0 w-full h-full bg-cover bg-center bg-no-repeat z-0"
              style={{
                backgroundImage: 'url(http://localhost:5000/uploads/shawshank_poster.jpg)',
              }}
            >
              {/* Background Blur Overlay */}
              <div className="absolute inset-0 backdrop-blur-lg"></div>
            </div>

            {/* Main Content */}
            <div className="relative z-20 container mx-auto p-4 sm:p-6">
              {/* Poster and Trailer Container */}
              <div className="p-6 mb-6 flex flex-col lg:flex-row">
                {/* Poster Film */}
                <div className="flex-none w-full lg:w-auto mb-4 lg:mb-0">
                  <img
                    src="http://localhost:5000/uploads/shawshank_poster.jpg"
                    alt="The Shawshank Redemption Poster"
                    className="w-auto h-auto max-w-full max-h-full rounded-lg shadow-lg"
                    style={{ maxHeight: '450px', objectFit: 'cover' }}
                  />
                </div>

                {/* Embedded Video for Trailer */}
                <div className="flex-grow lg:ml-6">
                  <iframe
                    width="100%"
                    height="450"
                    src="https://www.youtube.com/embed/NmzuHjWmXOc"
                    title="The Shawshank Redemption (1994) Official Trailer #1 - Morgan Freeman Movie HD"
                    frameBorder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    referrerPolicy="strict-origin-when-cross-origin"
                    allowFullScreen
                    className="rounded-lg shadow-lg"
                  ></iframe>
                </div>
              </div>

              {/* Detail Film */}
              <div className="p-6 rounded-lg shadow-lg mb-6 bg-white">
                <h2 className="text-3xl font-bold mb-3 text-gray-800">
                  The Shawshank Redemption
                </h2>
                <p className="mb-2 text-sm text-gray-800">
                  <strong>Date:</strong> September 23, 1994
                </p>
                <p className="mb-2 text-sm text-gray-800">
                  <strong>View:</strong> 25,000,000 views
                </p>
                <p className="mb-4 text-sm text-gray-800">
                  Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency. 
                  Based on the 1982 Stephen King novella "Rita Hayworth and Shawshank Redemption."
                </p>
                <p className="mb-2 text-sm text-gray-800"><strong>Genre:</strong> Drama</p>
                <p className="mb-2 text-sm text-gray-800"><strong>Duration:</strong> 2h 22min</p>
                <p className="mb-2 text-sm text-gray-800"><strong>Rating:</strong> 9.3/10 (IMDb)</p>
                <p className="mb-2 text-sm text-gray-800"><strong>Availability:</strong> Netflix, Hulu</p>
              </div>

              {/* Daftar Aktor */}
              <div className="p-6 rounded-lg shadow-lg mb-6 bg-white">
                <h3 className="text-lg font-bold mb-3 text-gray-800">Cast</h3>
                <div className="flex space-x-4">
                  <img
                    src="http://localhost:5000/uploads/tim_robbins.jpg"
                    alt="Tim Robbins"
                    className="w-20 h-20 rounded-full shadow-lg"
                  />
                  <img
                    src="http://localhost:5000/uploads/morgan_freeman.jpeg"
                    alt="Morgan Freeman"
                    className="w-20 h-20 rounded-full shadow-lg"
                  />
                  <img
                    src="http://localhost:5000/uploads/bob_gunton.jpeg"
                    alt="Bob Gunton"
                    className="w-20 h-20 rounded-full shadow-lg"
                  />
                </div>
              </div>

              {/* Combined User Reviews and Add Review Section */}
              <div className="p-6 rounded-lg shadow-lg mb-6 bg-white flex flex-col lg:flex-row space-y-6 lg:space-y-0 lg:space-x-6">
                <div className="lg:w-1/2">
                  <h3 className="text-lg font-bold mb-3 text-gray-800">User Reviews</h3>
                  <div className="flex flex-col items-center mb-3">
                    <label htmlFor="filter" className="mr-2 text-sm text-gray-800">Filter by:</label>
                    <select id="filter" className="border p-1 rounded text-sm">
                      <option value="5">5 Stars</option>
                      <option value="4">4 Stars</option>
                      <option value="3">3 Stars</option>
                      <option value="2">2 Stars</option>
                      <option value="1">1 Star</option>
                    </select>
                  </div>

                  <div className="space-y-3">
                    {[1, 2, 3, 4].map((review, index) => (
                      <div key={index} className="flex items-start space-x-3">
                        <div className="w-10 h-10 bg-gray-300 rounded-full"></div>
                        <div className="flex-grow">
                          <p className="text-gray-800 text-sm"><strong>User12345</strong> said: A masterpiece! A must-watch for everyone.</p>
                          <p className="text-xs text-gray-600">June 1, 2024 at 12:00 AM</p>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>

                <div className="lg:w-1/2">
                  <h3 className="text-lg font-bold mb-3 text-gray-800">Add your review!</h3>
                  <form>
                    <div className="mb-3">
                      <label htmlFor="rate" className="block mb-1 text-sm text-gray-800">Rate</label>
                      <select id="rate" className="border p-1 rounded w-full text-sm">
                        <option value="5">5 Stars</option>
                        <option value="4">4 Stars</option>
                        <option value="3">3 Stars</option>
                        <option value="2">2 Stars</option>
                        <option value="1">1 Star</option>
                      </select>
                    </div>
                    <div className="mb-3">
                      <label htmlFor="thoughts" className="block mb-1 text-sm text-gray-800">Your Thoughts</label>
                      <textarea
                        id="thoughts"
                        className="border p-1 rounded w-full text-sm"
                        rows="4"
                        placeholder="Share what you think..."
                      ></textarea>
                    </div>
                    <button type="submit" className="bg-orange-500 text-white px-3 py-1 rounded text-sm">Submit</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default MovieDetail;
