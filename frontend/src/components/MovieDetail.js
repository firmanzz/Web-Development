import React from 'react';

const MovieDetail = () => {
  return (
    <div className="container mx-auto p-4 sm:p-6">
      <div className="flex flex-col lg:flex-row mb-6">
        {/* Poster Film */}
        <div className="flex-none w-full lg:w-1/3 mb-4 lg:mb-0">
          <div className="bg-gray-300 h-48 lg:h-64 w-full rounded"></div>
        </div>

        {/* Detail Film */}
        <div className="flex-grow lg:ml-6">
          <h2 className="text-xl font-bold mb-3">
            Title of the drama that makes two lines
          </h2>
          <p className="mb-1 text-gray-600 text-sm">
            <strong>Date:</strong> June 1, 2024, 12:00 AM
          </p>
          <p className="mb-1 text-gray-600 text-sm">
            <strong>View:</strong> 1,234,567 views
          </p>
          <p className="mb-1 text-sm">
            The epic adventures continue. I won’t spoil the ending... But what happens is incredible! This is an amazing drama series with great performances from the main actors. The drama keeps you on the edge of your seat from start to finish.
          </p>
          <p className="mb-1 text-sm"><strong>Genre:</strong> Drama, Action, Romance</p>
          <p className="mb-1 text-sm"><strong>Duration:</strong> 2h 30min</p>
          <p className="mb-1 text-sm"><strong>Rating:</strong> 5.0/5</p>
          <p className="mb-1 text-sm"><strong>Availability:</strong> Netflix, DramaKu.co.id</p>
        </div>
      </div>

      {/* Daftar Aktor */}
      <div className="flex flex-wrap space-x-3 mb-6">
        <div className="flex-none w-16 h-24 bg-gray-300 rounded mb-4 lg:mb-0"></div>
        <div className="flex-none w-16 h-24 bg-gray-300 rounded mb-4 lg:mb-0"></div>
        <div className="flex-none w-16 h-24 bg-gray-300 rounded mb-4 lg:mb-0"></div>
        <div className="flex-none w-16 h-24 bg-gray-300 rounded mb-4 lg:mb-0"></div>
        <div className="flex-none w-16 h-24 bg-gray-300 rounded mb-4 lg:mb-0"></div>
      </div>

      {/* Player Video */}
      <div className="bg-gray-300 h-48 lg:h-64 w-full mb-6 rounded flex items-center justify-center">
        <div className="text-gray-500 text-sm">[ Video Player ]</div>
      </div>

      {/* Ulasan Pengguna */}
      <div className="mb-6">
        <h3 className="text-lg font-bold mb-3">64 People Think About this Drama</h3>
        <div className="flex flex-col sm:flex-row items-center mb-3">
          <label htmlFor="filter" className="mr-2 text-sm">Filter by:</label>
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
                <p className="text-gray-600 text-sm"><strong>User12345</strong> said: It was a wonderful drama! I love it so much!!!</p>
                <p className="text-xs text-gray-400">June 1, 2024 at 12:00 AM</p>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Tambahkan Ulasan */}
      <div className="mb-6">
        <h3 className="text-lg font-bold mb-3">Add yours!</h3>
        <form>
          <div className="mb-3">
            <label htmlFor="rate" className="block mb-1 text-sm">Rate</label>
            <select id="rate" className="border p-1 rounded w-full text-sm">
              <option value="5">5 Stars</option>
              <option value="4">4 Stars</option>
              <option value="3">3 Stars</option>
              <option value="2">2 Stars</option>
              <option value="1">1 Star</option>
            </select>
          </div>
          <div className="mb-3">
            <label htmlFor="thoughts" className="block mb-1 text-sm">Your Thoughts</label>
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
  );
};

export default MovieDetail;
