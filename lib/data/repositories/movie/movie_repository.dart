import 'package:reelhub/data/models/movie/movie_model.dart';

abstract class MovieRepository {
  Future<List<Movie>> getNowPlaying();
  Future<List<Movie>> getTopRated();
  Future<List<Movie>> getPopular();
  Future<List<Movie>> getUpcoming();
}
