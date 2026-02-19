import 'package:reelhub/data/models/movie/movie_model.dart';

abstract class TvRepository {
  Future<List<Movie>> getPopular();
  Future<List<Movie>> getTopRated();
}
