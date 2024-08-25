import React from 'react';

const MovieDetail = () => {
  return (
    <div className="p-8 bg-white">
      <header className="mb-6">
        <h1 className="text-4xl font-bold">DramaKu</h1>
      </header>
      <div className="flex mb-6">
        <img 
          src="path-to-movie-thumbnail.jpg" 
          alt="Movie Thumbnail" 
          className="w-64 h-96 object-cover rounded-md"
        />
        <div className="ml-6">
          <h2 className="text-3xl font-bold">Title of the drama that makes two lines</h2>
          <p className="text-lg text-gray-600">Other title: Title 2, Title 3, Title 4</p>
          <p className="text-lg text-gray-600">Year: 2024</p>
          <p className="mt-4">
            Synopsis: A brief summary of the movie goes here. It might be one or two paragraphs long to give the viewer an idea of the story.
          </p>
          <p className="mt-4">Genres: Genre 1, Genre 2, Genre 3</p>
          <p className="mt-2">Rating: 9.3/10</p>
          <p className="mt-2">Availability: Netflix, Episode 1-12</p>
        </div>
      </div>

      <div className="flex space-x-4 mb-6">
        {/* Actor Images */}
        <div className="w-20 h-20 bg-gray-200 rounded-md">Actor 1</div>
        <div className="w-20 h-20 bg-gray-200 rounded-md">Actor 2</div>
        <div className="w-20 h-20 bg-gray-200 rounded-md">Actor 3</div>
        <div className="w-20 h-20 bg-gray-200 rounded-md">Actor 4</div>
        <div className="w-20 h-20 bg-gray-200 rounded-md">Actor 5</div>
      </div>

      <div className="mb-6">
        <div className="w-full h-56 bg-gray-200 rounded-md">Video Player Placeholder</div>
      </div>

      <div className="mb-6">
        <h3 className="text-xl font-bold mb-4">(4) People think about this drama</h3>
        <div className="space-y-4">
          {/* Comments List */}
          <div className="p-4 bg-gray-100 rounded-md">
            <p className="font-bold">User1 <span className="text-sm text-gray-500">14/04/2023</span></p>
            <p className="text-gray-700">This drama is amazing! I loved it so much!!</p>
            <p className="text-yellow-500">★★★★☆</p>
          </div>
          <div className="p-4 bg-gray-100 rounded-md">
            <p className="font-bold">User2 <span className="text-sm text-gray-500">14/04/2023</span></p>
            <p className="text-gray-700">It was okay, not what I expected.</p>
            <p className="text-yellow-500">★★★☆☆</p>
          </div>
          {/* Additional Comments */}
        </div>
      </div>

      <div className="mb-6">
        <h3 className="text-xl font-bold mb-4">Add yours!</h3>
        <form>
          <input
            type="text"
            placeholder="Your Name"
            className="w-full p-2 mb-2 border rounded-md"
          />
          <input
            type="text"
            placeholder="Your Title"
            className="w-full p-2 mb-2 border rounded-md"
          />
          <textarea
            placeholder="Your thoughts"
            className="w-full p-2 mb-2 border rounded-md"
          ></textarea>
          <div className="flex justify-between items-center mb-4">
            <p className="text-yellow-500">Rating: ★★★★☆</p>
            <button className="p-2 bg-blue-500 text-white rounded-md">
              Submit
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default MovieDetail;
