import 'package:reelhub/data/models/movie_model.dart';

abstract class NowPlayingRepository {
  Future<List<Movie>> getNowPlaying();
}
