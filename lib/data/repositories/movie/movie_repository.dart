import 'package:reelhub/data/models/media/media_model.dart';

abstract class MovieRepository {
  Future<List<Media>> getNowPlaying();
  Future<List<Media>> getTopRated();
  Future<List<Media>> getPopular();
  Future<List<Media>> getUpcoming();
  Future<List<Media>?> getSimilar(int id);
}
