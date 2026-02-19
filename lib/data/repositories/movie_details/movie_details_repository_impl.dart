import 'package:reelhub/data/models/movie_details/movie_details_model.dart';
import 'package:reelhub/data/repositories/movie_details/movie_details_repository.dart';
import 'package:reelhub/data/services/tmdb_service.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final TmdbService _tmdb;

  MovieDetailsRepositoryImpl(this._tmdb);

  @override
  Future<MovieDetails> getMovieDetails(String id) {
    return _tmdb.getMovieDetails(id);
  }
}
