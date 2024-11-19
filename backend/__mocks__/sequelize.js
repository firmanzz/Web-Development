const SequelizeMock = require("sequelize-mock");
const dbMock = new SequelizeMock();

// Mock Movie model
const MovieMock = dbMock.define("Movie", {
  id: 1,
  title: "Mock Movie",
  alternativetitle: "Mock Alternate",
  synopsis: "This is a mock movie",
  releasedate: "2024-01-01",
  rating: 8.5,
  duration: 120,
  status: "Released",
  countryid: 1,
});

// Mock Genre model
const GenreMock = dbMock.define("Genre", {
  id: 1,
  name: "Action",
});

// Mock Actor model
const ActorMock = dbMock.define("Actor", {
  id: 1,
  name: "Robert Downey Jr.",
  birthdate: "1970-07-30",
  urlphoto: "nolan.jpg",
  countryid: 1,
});

const AwardMock = dbMock.define("Award", {
    id: 1,
    award: "Best Picture",
    year: 2024,
    countryid: 1,
  });
  
  // Mock Availability model
  const AvailabilityMock = dbMock.define("Availability", {
    id: 1,
    name: "Netflix",
  });
  
  // Mock Director model
  const DirectorMock = dbMock.define("Director", {
    id: 1,
    name: "Christopher Nolan",
    birthdate: "1970-07-30",
    urlphoto: "nolan.jpg",
    countryid: 1,
  });
  
  // Mock Relational Models
  const MovieAwardMock = dbMock.define("MovieAward", {
    movieid: 1,
    awardid: 1,
  });
  
  const MovieAvailabilityMock = dbMock.define("MovieAvailability", {
    movieid: 1,
    availid: 1,
  });
  
  const MovieDirectorMock = dbMock.define("MovieDirector", {
    movieid: 1,
    directorid: 1,
  });

// Mock Relational Models
const MovieGenreMock = dbMock.define("MovieGenre", {
  movieid: 1,
  genreid: 1,
});
const MovieActorMock = dbMock.define("MovieActor", {
  movieid: 1,
  actorid: 1,
});

// Setup Relations
MovieMock.belongsToMany(GenreMock, { through: MovieGenreMock });
GenreMock.belongsToMany(MovieMock, { through: MovieGenreMock });
MovieMock.belongsToMany(ActorMock, { through: MovieActorMock });
ActorMock.belongsToMany(MovieMock, { through: MovieActorMock });
MovieMock.belongsToMany(AwardMock, { through: MovieAwardMock });
AwardMock.belongsToMany(MovieMock, { through: MovieAwardMock });
MovieMock.belongsToMany(AvailabilityMock, { through: MovieAvailabilityMock });
AvailabilityMock.belongsToMany(MovieMock, { through: MovieAvailabilityMock });
MovieMock.belongsToMany(DirectorMock, { through: MovieDirectorMock });
DirectorMock.belongsToMany(MovieMock, { through: MovieDirectorMock });

module.exports = {
  Movie: MovieMock,
  Genre: GenreMock,
  Actor: ActorMock,
  Award: AwardMock,
  Availability: AvailabilityMock,
  Director: DirectorMock,
  dbMock,
};