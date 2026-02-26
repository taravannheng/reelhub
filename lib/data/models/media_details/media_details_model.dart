import 'package:reelhub/data/models/genre/genre_model.dart';
import 'package:reelhub/data/models/movie/movie_model.dart';
import 'package:reelhub/data/models/production_company/production_company_model.dart';
import 'package:reelhub/data/models/tv_show/tv_show_model.dart';

class MediaDetails {
  final String? title;
  final String? releaseDate;
  final int? runtime;
  final List<Genre>? genres;
  final List<ProductionCompany>? productionCompanies;
  final bool? adult;
  final double? popularity;
  final String? originalLanguage;
  final String? overview;

  const MediaDetails({
    this.title,
    this.releaseDate,
    this.runtime,
    this.genres,
    this.productionCompanies,
    this.adult,
    this.popularity,
    this.originalLanguage,
    this.overview,
  });

  factory MediaDetails.empty() {
    return const MediaDetails(
      title: '',
      releaseDate: '',
      runtime: 0,
      genres: [],
      productionCompanies: [],
      adult: false,
      popularity: 0.0,
      originalLanguage: '',
      overview: '',
    );
  }

  factory MediaDetails.fromTvShow(TvShow? tvShow) {
    if (tvShow == null) return MediaDetails.empty();

    return MediaDetails(
      title: tvShow.name,
      releaseDate: tvShow.firstAirDate,
      runtime: tvShow.episodeRunTime.isNotEmpty
          ? tvShow.episodeRunTime.first
          : null,
      genres: tvShow.genres,
      productionCompanies: tvShow.productionCompanies,
      adult: tvShow.adult,
      popularity: tvShow.popularity,
      originalLanguage: tvShow.originalLanguage,
      overview: tvShow.overview,
    );
  }

  factory MediaDetails.fromMovie(Movie? movie) {
    if (movie == null) return MediaDetails.empty();

    return MediaDetails(
      title: movie.title,
      releaseDate: movie.releaseDate,
      runtime: movie.runtime,
      genres: movie.genres,
      productionCompanies: movie.productionCompanies,
      adult: movie.adult,
      popularity: movie.popularity,
      originalLanguage: movie.originalLanguage,
      overview: movie.overview,
    );
  }
}
