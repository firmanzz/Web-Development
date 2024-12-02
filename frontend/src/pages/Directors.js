import { useState, useEffect, useRef } from "react";
import Sidebar from "../components/Sidebar";
import Header from "../components/Header";
import Footer from "../components/Footer";
import Cookies from "js-cookie";

const Celebs = () => {
  const [open, setOpen] = useState(false);
  const [directors, setDirectors] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const sidebarRef = useRef(null);

  useEffect(() => {
    const fetchDirectors = async () => {
      try {
        const token = Cookies.get("token"); // Ambil token dari cookies
        const response = await fetch("https://master-movie-cms.vercel.app/api/directors", {
          headers: {
            Authorization: `Bearer ${token}`, // Tambahkan token ke header Authorization
          },
        });
        if (!response.ok) {
          throw new Error(`Failed to fetch directors: ${response.statusText}`);
        }
        const data = await response.json();
        setDirectors(data);
        setLoading(false);
      } catch (error) {
        console.error("Error fetching directors:", error);
        setError("Failed to load directors. Please try again later.");
        setLoading(false);
      }
    };

    fetchDirectors();
  }, []);
  

  return (
    <div className="flex flex-col min-h-screen">
      <Header open={open} setOpen={setOpen} />
      <div className="flex flex-grow">
        <Sidebar ref={sidebarRef} open={open} setOpen={setOpen} />
        <div className="flex-col flex-grow overflow-y-auto bg-gray-800 relative">
          <div
            className="fixed top-0 left-0 w-full h-full bg-cover bg-center bg-no-repeat z-0"
            style={{
              backgroundImage: 'url(https://master-movie-cms.vercel.app/uploads/home_background.jpg)',
            }}
          >
            <div className="absolute inset-0 backdrop-blur-lg"></div>
          </div>
          <div className="relative z-20 flex flex-col flex-grow items-center justify-start pt-2">
              <div className="container mx-auto">
              <div className="flex justify-center my-4">
              </div>
              {loading ? (
                <p className="text-white text-center">Loading directors...</p>
              ) : error ? (
                <p className="text-red-500 text-center">{error}</p>
              ) : (
                <>
                  <div className="grid grid-cols-2 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-20 mt-10 mb-40">
                    {directors.map((director) => (

                        <div className="text-center">
                          <img src={director.urlphoto} alt={director.urlphoto} className="h-full w-full object-cover rounded-md mb-2" />
                          <h3 className="text-white text-sm font-bold mb-1">{director.name}</h3>
                          <p className="text-white text-sm font-semibold">{new Date(director.birthdate).toLocaleDateString()}</p>
                          <p className="text-yellow-500 text-xs font-semibold">{director.Country.name}</p>
                        </div>

                    ))}
                  </div>
                </>
              )}
            </div>
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default Celebs;
