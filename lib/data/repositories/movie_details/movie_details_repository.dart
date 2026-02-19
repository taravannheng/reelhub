import 'package:reelhub/data/models/movie_details/movie_details_model.dart';

abstract class MovieDetailsRepository {
  Future<MovieDetails> getMovieDetails(String id);
}
