const sequelize = require('../config/database');

// Import semua model
const Comment = require('./Comment');
const Movie = require('./Movie');
const User = require('./User');
const Country = require('./Countries');
const Genre = require('./Genre');
const Actor = require('./Actor');
const Director = require('./Director');
const Availability = require('./Availability');
const Award = require('./Award');

// Atur asosiasi di sini
Comment.belongsTo(Movie, { foreignKey: "movieid" });
Movie.hasMany(Comment, { foreignKey: "movieid" });

Comment.belongsTo(User, { foreignKey: "userid" });
User.hasMany(Comment, { foreignKey: "userid" });

Movie.belongsTo(Country, { foreignKey: "countryid" });
Country.hasMany(Movie, { foreignKey: "countryid" });

Movie.belongsToMany(Genre, { through: MovieGenre, foreignKey: 'movieid', otherKey: 'genreid' });
Genre.belongsToMany(Movie, { through: MovieGenre, foreignKey: 'genreid', otherKey: 'movieid' });
Movie.belongsToMany(Award, { through: MovieAward, foreignKey: 'movieid', otherKey: 'awardid' });
Award.belongsToMany(Movie, { through: MovieAward, foreignKey: 'awardid', otherKey: 'movieid' });
Movie.belongsToMany(Actor, { through: MovieActor, foreignKey: 'movieid', otherKey: 'actorid' });
Actor.belongsToMany(Movie, { through: MovieActor, foreignKey: 'actorid', otherKey: 'movieid' });
Movie.belongsToMany(Director, { through: MovieDirector, foreignKey: 'movieid', otherKey: 'directorid' });
Director.belongsToMany(Movie, { through: MovieDirector, foreignKey: 'directorid', otherKey: 'movieid' });
Movie.belongsToMany(Availability, { through: MovieAvailability, foreignKey: 'movieid', otherKey: 'availid' });
Availability.belongsToMany(Movie, { through: MovieAvailability, foreignKey: 'availid', otherKey: 'movieid' });

// Tambahkan asosiasi lainnya di sini

module.exports = {
  sequelize,
  Comment,
  Movie,
  User,
  Country,
  Genre,
  Actor,
  Director,
  Availability,
  Award,
};
