import 'package:reelhub/data/models/movie_model.dart';

abstract class MovieRepository {
  Future<List<Movie>> getNowPlaying();
  Future<List<Movie>> getTopRated();
}
