import 'package:reelhub/data/models/movie/movie_model.dart';

abstract class MovieDetailsRepository {
  Future<Movie?> getMovieDetails(String id);
}
