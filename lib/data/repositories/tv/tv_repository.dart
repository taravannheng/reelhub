import 'package:reelhub/data/models/media/media_model.dart';

abstract class TvRepository {
  Future<List<Media>> getPopular();
  Future<List<Media>> getTopRated();
}
