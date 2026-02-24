import 'package:reelhub/data/models/cast/cast_model.dart';
import 'package:reelhub/data/models/media/media_model.dart';
import 'package:reelhub/data/models/movie_details/movie_details_model.dart';
import 'package:reelhub/data/models/trailer/trailer_model.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TmdbService {
  final TMDB _tmdb;

  TmdbService(this._tmdb);

  Future<List<Media>?> getSimilarMovies(int id) async {
    try {
      final Map<dynamic, dynamic> results = await _tmdb.v3.movies.getSimilar(
        id,
      );

      final similarMovieList = (results["results"] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((item) => Media.fromJson(item))
          .toList();

      return similarMovieList;
    } catch (e) {
      return null;
    }
  }

  Future<List<Cast>?> getCasts(String id) async {
    try {
      final Map<dynamic, dynamic> results = await _tmdb.v3.movies.getCredits(
        int.parse(id),
      );

      final castList = (results["cast"] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((item) => Cast.fromJson(item))
          .toList();

      return castList;
    } catch (e) {
      return null;
    }
  }

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

  Future<List<Media>> getTrending() async {
    try {
      final Map<dynamic, dynamic> results = await _tmdb.v3.trending.getTrending(
        mediaType: MediaType.all,
        timeWindow: TimeWindow.day,
      );

      final trendingList = (results["results"] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((item) => Media.fromJson(item))
          .toList();

      return trendingList;
    } catch (e) {
      return [];
    }
  }

  Future<List<Media>> getNowPlaying() async {
    try {
      final Map<dynamic, dynamic> results = await _tmdb.v3.movies
          .getNowPlaying();

      final nowPlayingList = (results["results"] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((item) => Media.fromJson(item))
          .toList();

      return nowPlayingList;
    } catch (e) {
      return [];
    }
  }

  Future<List<Media>> getPopularTvShows() async {
    try {
      final Map<dynamic, dynamic> results = await _tmdb.v3.tv.getPopular();

      final popularList = (results["results"] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((item) => Media.fromJson(item))
          .toList();

      return popularList;
    } catch (e) {
      return [];
    }
  }

  Future<List<Media>> getTopRatedMovies() async {
    try {
      final Map<dynamic, dynamic> results = await _tmdb.v3.movies.getTopRated();

      final topRatedMovieList = (results["results"] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((item) => Media.fromJson(item))
          .toList();

      return topRatedMovieList;
    } catch (e) {
      return [];
    }
  }

  Future<List<Media>> getTopRatedTvShows() async {
    try {
      final Map<dynamic, dynamic> results = await _tmdb.v3.tv.getTopRated();

      final topRatedTvShowsList = (results["results"] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((item) => Media.fromJson(item))
          .toList();

      return topRatedTvShowsList;
    } catch (e) {
      return [];
    }
  }

  Future<List<Media>> getPopularMovies() async {
    try {
      final Map<dynamic, dynamic> results = await _tmdb.v3.movies.getPopular();

      final popularMovieList = (results["results"] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((item) => Media.fromJson(item))
          .toList();

      return popularMovieList;
    } catch (e) {
      return [];
    }
  }

  Future<List<Media>> getUpcomingMovies() async {
    try {
      final Map<dynamic, dynamic> results = await _tmdb.v3.movies.getUpcoming();

      final upcomingMovieList = (results["results"] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((item) => Media.fromJson(item))
          .toList();

      return upcomingMovieList;
    } catch (e) {
      return [];
    }
  }
}
