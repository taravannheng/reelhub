import 'package:reelhub/data/models/media/media_model.dart';
import 'package:reelhub/data/models/tv_show/tv_show_model.dart';

abstract class TvRepository {
  Future<List<Media>> getPopular();
  Future<List<Media>> getTopRated();
  Future<TvShow?> getDetails(int id);
  Future<List<Media>?> getSimilar(int id);
}
