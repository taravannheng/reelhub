import 'package:reelhub/data/models/movie/movie_model.dart';
import 'package:reelhub/data/models/movie_details/movie_details_model.dart';
import 'package:reelhub/data/models/trailer/trailer_model.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TmdbService {
  final TMDB _tmdb;

  TmdbService(this._tmdb);

  Future<List<Trailer>> getTrailers(String id) async {
    try {
      final Map<dynamic, dynamic> results = await _tmdb.v3.movies.getVideos(
        int.parse(id),
      );

      final trailerList = (results["results"] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((item) => Trailer.fromJson(item))
          .toList();

      return trailerList;
    } catch (e) {
      return [];
    }
  }

  Future<MovieDetails?> getMovieDetails(String id) async {
    try {
      final Map<dynamic, dynamic> result = await _tmdb.v3.movies.getDetails(
        int.parse(id),
      );

      return MovieDetails.fromJson(result as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  Future<List<Movie>> getTrending() async {
    try {
      final Map<dynamic, dynamic> results = await _tmdb.v3.trending.getTrending(
        mediaType: MediaType.all,
        timeWindow: TimeWindow.day,
      );

      final trendingList = (results["results"] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((item) => Movie.fromJson(item))
          .toList();

      return trendingList;
    } catch (e) {
      return [];
    }
  }

  Future<List<Movie>> getNowPlaying() async {
    try {
      final Map<dynamic, dynamic> results = await _tmdb.v3.movies
          .getNowPlaying();

      final nowPlayingList = (results["results"] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((item) => Movie.fromJson(item))
          .toList();

      return nowPlayingList;
    } catch (e) {
      return [];
    }
  }

  Future<List<Movie>> getPopularTvShows() async {
    try {
      final Map<dynamic, dynamic> results = await _tmdb.v3.tv.getPopular();

      final popularList = (results["results"] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((item) => Movie.fromJson(item))
          .toList();

      return popularList;
    } catch (e) {
      return [];
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    try {
      final Map<dynamic, dynamic> results = await _tmdb.v3.movies.getTopRated();

      final topRatedMovieList = (results["results"] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((item) => Movie.fromJson(item))
          .toList();

      return topRatedMovieList;
    } catch (e) {
      return [];
    }
  }

  Future<List<Movie>> getTopRatedTvShows() async {
    try {
      final Map<dynamic, dynamic> results = await _tmdb.v3.tv.getTopRated();

      final topRatedTvShowsList = (results["results"] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((item) => Movie.fromJson(item))
          .toList();

      return topRatedTvShowsList;
    } catch (e) {
      return [];
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    try {
      final Map<dynamic, dynamic> results = await _tmdb.v3.movies.getPopular();

      final popularMovieList = (results["results"] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((item) => Movie.fromJson(item))
          .toList();

      return popularMovieList;
    } catch (e) {
      return [];
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    try {
      final Map<dynamic, dynamic> results = await _tmdb.v3.movies.getUpcoming();

      final upcomingMovieList = (results["results"] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((item) => Movie.fromJson(item))
          .toList();

      return upcomingMovieList;
    } catch (e) {
      return [];
    }
  }
}
