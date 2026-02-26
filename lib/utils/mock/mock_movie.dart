import 'package:reelhub/data/models/genre/genre_model.dart';
import 'package:reelhub/data/models/movie/movie_model.dart';
import 'package:reelhub/data/models/production_company/production_company_model.dart';
import 'package:reelhub/data/models/production_country/production_country_model.dart';
import 'package:reelhub/data/models/spoken_language/spoken_language_model.dart';

final mockMovie = Movie(
  adult: false,
  backdropPath: "/8pjWz2lt29KyVGoq1mXYu6Br7dE.jpg",
  belongsToCollection: null,
  budget: 160000000,
  genres: [
    Genre(id: 28, name: "Action"),
    Genre(id: 878, name: "Science Fiction"),
    Genre(id: 12, name: "Adventure"),
  ],
  homepage: "https://www.examplemovie.com",
  id: 550988,
  imdbId: "tt1234567",
  originalLanguage: "en",
  originalTitle: "Example Movie",
  overview:
      "In a world where technology and humanity collide, a reluctant hero rises to face an impossible mission that will determine the fate of millions.",
  popularity: 982.345,
  posterPath: "/xGuOF1T3WmPsAcQEQJfnG7Ud9f8.jpg",
  productionCompanies: [
    ProductionCompany(
      id: 420,
      logoPath: "/hUzeosd33nzE5MCNsZxCGEKTXaQ.png",
      name: "Marvel Studios",
      originCountry: "US",
    ),
    ProductionCompany(
      id: 9996,
      logoPath: "/3tvBqYsBhxWeHlu62SIJ1el93O7.png",
      name: "Walt Disney Pictures",
      originCountry: "US",
    ),
  ],
  productionCountries: [
    ProductionCountry(iso31661: "US", name: "United States of America"),
  ],
  releaseDate: "2024-07-12",
  revenue: 850000000,
  runtime: 142,
  spokenLanguages: [
    SpokenLanguage(englishName: "English", iso6391: "en", name: "English"),
  ],
  status: "Released",
  tagline: "The future begins now.",
  title: "Example Movie",
  video: false,
  voteAverage: 7.8,
  voteCount: 12450,
);
