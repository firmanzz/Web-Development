const Filter = ({ genre, setGenre, year, setYear, status, setStatus, handleSubmit }) => {
    return (
      <div className="flex flex-col space-y-4 mb-2">
        <div className="flex space-x-4">
          <select
            className="p-2 bg-gray-200 rounded"
            value={genre}
            onChange={(e) => setGenre(e.target.value)}
          >
            <option value="" disabled selected hidden>Genre</option>
            <option value="Action">Action</option>
            <option value="Drama">Drama</option>
            <option value="Comedy">Comedy</option>
          </select>
  
          <select
            className="p-2 bg-gray-200 rounded"
            value={year}
            onChange={(e) => setYear(e.target.value)}
          >
            <option value="" disabled selected hidden>Year</option>
            <option value="2022">2022</option>
            <option value="2021">2021</option>
            <option value="2020">2020</option>
          </select>
  
          <select
            className="p-2 bg-gray-200 rounded"
            value={status}
            onChange={(e) => setStatus(e.target.value)}
          >
            <option value="" disabled selected hidden>Status</option>
            <option value="Ongoing">Ongoing</option>
            <option value="Completed">Completed</option>
          </select>
        </div>
  
        <button className="p-2 bg-blue-500 text-white rounded self-center" onClick={handleSubmit}>
          Submit
        </button>
      </div>
    );
  };
  
  export default Filter;
  