/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {
      colors: {
      "dark-purple": "#006849",
      'light-white': 'rgba(255,255,255,0.18)',
      "grey": "#999999",
      "background": "#96cdb9"
      }
    },
  },
  plugins: [],
}

