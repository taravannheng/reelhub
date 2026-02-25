import 'package:reelhub/data/models/media/media_model.dart';
import 'package:reelhub/data/repositories/movie/movie_repository.dart';
import 'package:reelhub/data/services/tmdb_service.dart';

class MovieRepositoryImpl implements MovieRepository {
  final TmdbService _tmdb;

  MovieRepositoryImpl(this._tmdb);

  @override
  Future<List<Media>> getNowPlaying() {
    return _tmdb.getNowPlaying();
  }

  @override
  Future<List<Media>> getTopRated() {
    return _tmdb.getTopRatedMovies();
  }

  @override
  Future<List<Media>> getPopular() {
    return _tmdb.getPopularMovies();
  }

  @override
  Future<List<Media>> getUpcoming() {
    return _tmdb.getUpcomingMovies();
  }

  @override
  Future<List<Media>?> getSimilar(int id) {
    return _tmdb.getSimilar(id, isMovie: true);
  }
}
