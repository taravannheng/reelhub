import 'package:reelhub/data/models/creator/creator_model.dart';
import 'package:reelhub/data/models/episode/episode_model.dart';
import 'package:reelhub/data/models/genre/genre_model.dart';
import 'package:reelhub/data/models/network_company/network_company_model.dart';
import 'package:reelhub/data/models/production_company/production_company_model.dart';
import 'package:reelhub/data/models/production_country/production_country_model.dart';
import 'package:reelhub/data/models/season/season_model.dart';
import 'package:reelhub/data/models/spoken_language/spoken_language_model.dart';
import 'package:reelhub/data/models/tv_show/tv_show_model.dart';

final mockTvShow = TvShow(
  adult: false,
  backdropPath: "/z2yahl2uefxDCl0nogcRBstwruJ.jpg",
  createdBy: [
    Creator(
      id: 12345,
      creditId: "5256c8af19c2956ff604858a",
      name: "John Doe",
      gender: 2,
      profilePath: "/z2yahl2uefxDCl0nogcRBstwruJ.jpg",
    ),
  ],
  episodeRunTime: [45],
  firstAirDate: "2022-09-15",
  genres: [
    Genre(id: 18, name: "Drama"),
    Genre(id: 9648, name: "Mystery"),
  ],
  homepage: "https://www.exampletvshow.com",
  id: 999001,
  inProduction: true,
  languages: ["en"],
  lastAirDate: "2025-01-10",
  lastEpisodeToAir: Episode(
    id: 2001,
    name: "The Final Clue",
    overview:
        "Secrets unravel as the team uncovers the truth behind the conspiracy.",
    voteAverage: 8.4,
    voteCount: 320,
    airDate: "2025-01-10",
    episodeNumber: 10,
    runtime: 47,
    seasonNumber: 3,
    stillPath: "/z2yahl2uefxDCl0nogcRBstwruJ.jpg",
  ),
  name: "Mystery Falls",
  nextEpisodeToAir: null,
  networks: [
    Network(
      id: 213,
      name: "Netflix",
      logoPath: "/wwemzKWzjKYJFfCeiB57q3r4Bcm.png",
      originCountry: "US",
    ),
  ],
  numberOfEpisodes: 30,
  numberOfSeasons: 3,
  originCountry: ["US"],
  originalLanguage: "en",
  originalName: "Mystery Falls",
  overview:
      "A small town hides big secrets. When a journalist returns home, she uncovers mysteries that change everything.",
  popularity: 512.78,
  posterPath: "/z2yahl2uefxDCl0nogcRBstwruJ.jpg",
  productionCompanies: [
    ProductionCompany(
      id: 10101,
      name: "Example Studios",
      logoPath: "/z2yahl2uefxDCl0nogcRBstwruJ.jpg",
      originCountry: "US",
    ),
  ],
  productionCountries: [
    ProductionCountry(iso31661: "US", name: "United States of America"),
  ],
  seasons: [
    Season(
      airDate: "2022-09-15",
      episodeCount: 10,
      id: 3001,
      name: "Season 1",
      overview: "The mystery begins.",
      posterPath: "/z2yahl2uefxDCl0nogcRBstwruJ.jpg",
      seasonNumber: 1,
      voteAverage: 8.0,
    ),
    Season(
      airDate: "2023-09-20",
      episodeCount: 10,
      id: 3002,
      name: "Season 2",
      overview: "The stakes get higher.",
      posterPath: "/z2yahl2uefxDCl0nogcRBstwruJ.jpg",
      seasonNumber: 2,
      voteAverage: 8.3,
    ),
    Season(
      airDate: "2024-10-05",
      episodeCount: 10,
      id: 3003,
      name: "Season 3",
      overview: "Everything comes to light.",
      posterPath: "/z2yahl2uefxDCl0nogcRBstwruJ.jpg",
      seasonNumber: 3,
      voteAverage: 8.5,
    ),
  ],
  spokenLanguages: [
    SpokenLanguage(englishName: "English", iso6391: "en", name: "English"),
  ],
  status: "Returning Series",
  tagline: "Every secret has a price.",
  type: "Scripted",
  voteAverage: 8.2,
  voteCount: 5400,
);
