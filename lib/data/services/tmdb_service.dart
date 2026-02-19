import 'package:reelhub/data/models/movie/movie_model.dart';
import 'package:reelhub/data/models/movie_details/movie_details_model.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TmdbService {
  final TMDB _tmdb;

  TmdbService(this._tmdb);

  Future<MovieDetails> getMovieDetails(String id) async {
    final Map<dynamic, dynamic> result = await _tmdb.v3.movies.getDetails(
      int.parse(id),
    );

    return MovieDetails.fromJson(result as Map<String, dynamic>);
  }

  Future<List<Movie>> getTrending() async {
    final Map<dynamic, dynamic> results = await _tmdb.v3.trending.getTrending(
      mediaType: MediaType.all,
      timeWindow: TimeWindow.day,
    );

    try {
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
    final Map<dynamic, dynamic> results = await _tmdb.v3.movies.getNowPlaying();

    try {
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
    final Map<dynamic, dynamic> results = await _tmdb.v3.tv.getPopular();

    try {
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
    final Map<dynamic, dynamic> results = await _tmdb.v3.movies.getTopRated();

    try {
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
    final Map<dynamic, dynamic> results = await _tmdb.v3.tv.getTopRated();

    try {
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
    final Map<dynamic, dynamic> results = await _tmdb.v3.movies.getPopular();

    try {
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
    final Map<dynamic, dynamic> results = await _tmdb.v3.movies.getUpcoming();

    try {
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
