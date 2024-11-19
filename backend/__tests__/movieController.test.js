const { Movie, Genre, Actor, Award, Availability, Director } = require("../__mocks__/sequelize");
const { genres, actors, movie } = require("../utils/sampleData");

describe("Movie Controller Tests with Mocks", () => {
    beforeAll(() => {
        Movie.$queueResult([
          Movie.build({
            id: 1,
            title: "Mock Movie",
            alternativetitle: "Mock Alternate",
            synopsis: "This is a mock movie",
            releasedate: "2024-01-01",
            rating: 8.5,
            duration: 120,
            status: "Released",
            countryid: 1,
          }),
        ]);
      
        Genre.$queueResult([
          Genre.build({ id: 1, name: "Action" }),
          Genre.build({ id: 2, name: "Drama" }),
        ]);
      
        Actor.$queueResult([
          Actor.build({ id: 1, name: "Robert Downey Jr." }),
          Actor.build({ id: 2, name: "Scarlett Johansson" }),
        ]);
      
        Award.$queueResult([
          Award.build({ id: 1, award: "Best Picture", year: 2024, countryid: 1 }),
          Award.build({ id: 2, award: "Best Director", year: 2024, countryid: 1 }),
        ]);
      
        Availability.$queueResult([
          Availability.build({ id: 1, name: "Netflix" }),
          Availability.build({ id: 2, name: "Amazon Prime" }),
        ]);
      
        Director.$queueResult([
          Director.build({ id: 1, name: "Christopher Nolan", birthdate: "1970-07-30", urlphoto: "nolan.jpg", countryid: 1 }),
          Director.build({ id: 2, name: "Steven Spielberg", birthdate: "1946-12-18", urlphoto: "spielberg.jpg", countryid: 1 }),
        ]);
      });
      
  it("should create a new movie with relations", async () => {
    const newMovie = await Movie.create(movie);
    expect(newMovie.title).toBe("Mock Movie");
  });

  it("should fetch all movies", async () => {
    const movies = await Movie.findAll({
      include: [Award, Availability, Director, Genre, Actor],
    });
  
    expect(movies.length).toBeGreaterThan(0);
    expect(movies[0].title).toBe("Mock Movie");
  
  });
  

  it("should update a movie", async () => {
    const updatedMovie = await Movie.update(
      { title: "Updated Mock Movie" },
      { where: { id: 1 } }
    );
    expect(updatedMovie[0]).toBe(1); // 1 row affected
  });

  it("should delete a movie", async () => {
    const result = await Movie.destroy({ where: { id: 1 } });
    expect(result).toBe(1); // 1 row deleted
  });
});
