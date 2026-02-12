import 'package:reelhub/data/models/movie_model.dart';
import 'package:reelhub/data/repositories/movie/movie_repository.dart';
import 'package:reelhub/data/services/tmdb_service.dart';

class MovieRepositoryImpl implements MovieRepository {
  final TmdbService _tmdb;

  MovieRepositoryImpl(this._tmdb);

  @override
  Future<List<Movie>> getNowPlaying() {
    return _tmdb.getNowPlaying();
  }

  @override
  Future<List<Movie>> getTopRated() {
    return _tmdb.getTopRatedMovies();
  }

  @override
  Future<List<Movie>> getPopular() {
    return _tmdb.getPopularMovies();
  }
}
