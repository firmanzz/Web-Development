const genres = [{ id: 1, name: "Action" }, { id: 2, name: "Drama" }];
const actors = [{ id: 1, name: "Robert Downey Jr." }, { id: 2, name: "Scarlett Johansson" }];
const movie = {
  id: 1,
  title: "Mock Movie",
  alternativetitle: "Mock Alternate",
  synopsis: "This is a mock movie",
  releasedate: "2024-01-01",
  rating: 8.5,
  duration: 120,
  status: "Released",
  countryid: 1,
};
const awards = [
  { id: 1, award: "Best Picture", year: 2024, countryid: 1 },
  { id: 2, award: "Best Director", year: 2024, countryid: 1 },
];

const availabilities = [
  { id: 1, name: "Netflix" },
  { id: 2, name: "Amazon Prime" },
];

const directors = [
  { id: 1, name: "Christopher Nolan", birthdate: "1970-07-30", urlphoto: "nolan.jpg", countryid: 1 },
  { id: 2, name: "Steven Spielberg", birthdate: "1946-12-18", urlphoto: "spielberg.jpg", countryid: 1 },
];


module.exports = { genres, actors, movie, awards, availabilities,directors };
