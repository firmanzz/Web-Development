import React from 'react';

const MovieDetail = () => {
  return (
    <div className="container mx-auto p-8">
      <div className="flex flex-col lg:flex-row mb-8">
        {/* Poster Film */}
        <div className="flex-none w-full lg:w-1/3 mb-4 lg:mb-0">
          <div className="bg-gray-300 h-64 w-full rounded"></div>
        </div>

        {/* Detail Film */}
        <div className="flex-grow lg:ml-8">
          <h2 className="text-2xl font-bold mb-4">
            Title of the drama that makes two lines
          </h2>
          <p className="mb-2 text-gray-600">
            <strong>Date:</strong> June 1, 2024, 12:00 AM
          </p>
          <p className="mb-2 text-gray-600">
            <strong>View:</strong> 1,234,567 views
          </p>
          <p className="mb-2">
            The epic adventures continue. I won’t spoil the ending... But what happens is incredible! This is an amazing drama series with great performances from the main actors. The drama keeps you on the edge of your seat from start to finish.
          </p>
          <p className="mb-2"><strong>Genre:</strong> Drama, Action, Romance</p>
          <p className="mb-2"><strong>Duration:</strong> 2h 30min</p>
          <p className="mb-2"><strong>Rating:</strong> 5.0/5</p>
          <p className="mb-2"><strong>Availability:</strong> Netflix, DramaKu.co.id</p>
        </div>
      </div>

      {/* Daftar Aktor */}
      <div className="flex space-x-4 mb-8">
        <div className="flex-none w-24 h-32 bg-gray-300 rounded"></div>
        <div className="flex-none w-24 h-32 bg-gray-300 rounded"></div>
        <div className="flex-none w-24 h-32 bg-gray-300 rounded"></div>
        <div className="flex-none w-24 h-32 bg-gray-300 rounded"></div>
        <div className="flex-none w-24 h-32 bg-gray-300 rounded"></div>
      </div>

      {/* Player Video */}
      <div className="bg-gray-300 h-64 w-full mb-8 rounded flex items-center justify-center">
        <div className="text-gray-500">[ Video Player ]</div>
      </div>

      {/* Ulasan Pengguna */}
      <div className="mb-8">
        <h3 className="text-xl font-bold mb-4">64 People Think About this Drama</h3>
        <div className="flex items-center mb-4">
          <label htmlFor="filter" className="mr-2">Filter by:</label>
          <select id="filter" className="border p-2 rounded">
            <option value="5">5 Stars</option>
            <option value="4">4 Stars</option>
            <option value="3">3 Stars</option>
            <option value="2">2 Stars</option>
            <option value="1">1 Star</option>
          </select>
        </div>

        <div className="space-y-4">
          {/* Ulasan Individu */}
          {[1, 2, 3, 4].map((review, index) => (
            <div key={index} className="flex items-start space-x-4">
              <div className="w-12 h-12 bg-gray-300 rounded-full"></div>
              <div className="flex-grow">
                <p className="text-gray-600"><strong>User12345</strong> said: It was a wonderful drama! I love it so much!!!</p>
                <p className="text-sm text-gray-400">June 1, 2024 at 12:00 AM</p>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Tambahkan Ulasan */}
      <div className="mb-8">
        <h3 className="text-xl font-bold mb-4">Add yours!</h3>
        <form>
          <div className="mb-4">
            <label htmlFor="rate" className="block mb-2">Rate</label>
            <select id="rate" className="border p-2 rounded w-full">
              <option value="5">5 Stars</option>
              <option value="4">4 Stars</option>
              <option value="3">3 Stars</option>
              <option value="2">2 Stars</option>
              <option value="1">1 Star</option>
            </select>
          </div>
          <div className="mb-4">
            <label htmlFor="thoughts" className="block mb-2">Your Thoughts</label>
            <textarea
              id="thoughts"
              className="border p-2 rounded w-full"
              rows="4"
              placeholder="Share what you think..."
            ></textarea>
          </div>
          <button type="submit" className="bg-orange-500 text-white px-4 py-2 rounded">Submit</button>
        </form>
      </div>
    </div>
  );
};

export default MovieDetail;
