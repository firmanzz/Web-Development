import React from 'react';
import { FaFacebookF, FaTwitter, FaInstagram } from 'react-icons/fa';

const Footer = () => {
  return (
    <footer className="bg-gray-700 text-white py-8">
      <div className="container mx-auto grid grid-cols-1 md:grid-cols-3 gap-8">
        {/* Kolom 1: Tentang Kami */}
        <div>
          <h2 className="text-xl font-bold mb-4">Tentang MasterFilm</h2>
          <p>
            MasterFilm adalah platform rekomendasi film terbaik untuk Anda. 
            Temukan film favorit Anda dan nikmati pengalaman menonton yang luar biasa.
          </p>
        </div>

        {/* Kolom 2: Tautan Penting */}
        <div>
          <h2 className="text-xl font-bold mb-4">Tautan Penting</h2>
          <ul>
            <li className="mb-2"><a href="/about" className="hover:underline">Tentang Kami</a></li>
            <li className="mb-2"><a href="/faq" className="hover:underline">FAQ</a></li>
            <li className="mb-2"><a href="/contact" className="hover:underline">Kontak Kami</a></li>
            <li className="mb-2"><a href="/terms" className="hover:underline">Syarat dan Ketentuan</a></li>
            <li className="mb-2"><a href="/privacy" className="hover:underline">Kebijakan Privasi</a></li>
          </ul>
        </div>

        {/* Kolom 3: Kontak dan Media Sosial */}
        <div>
          <h2 className="text-xl font-bold mb-4">Kontak Kami</h2>
          <p className="mb-4">Jl. Gegerkalong Hilir, Ciwaruga, Kec. Parongpong, Kabupaten Bandung Barat, Jawa Barat 40559</p>
          <p className="mb-4">Email: support@Masterfilm.com</p>
          <p className="mb-4">Telepon: +62 123 4567 890</p>
          <div className="flex space-x-4 mt-4">
            <a href="https://facebook.com" className="hover:text-blue-500"><FaFacebookF /></a>
            <a href="https://twitter.com" className="hover:text-blue-400"><FaTwitter /></a>
            <a href="https://instagram.com" className="hover:text-pink-500"><FaInstagram /></a>
          </div>
        </div>
      </div>
      <div className="text-center mt-8">
        <p>&copy; 2024 MasterFilm. All Rights Reserved.</p>
      </div>
    </footer>
  );
};

export default Footer;