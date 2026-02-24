import 'package:reelhub/data/models/media/media_model.dart';

abstract class TrendingRepository {
  Future<List<Media>> getTrending();
}
