import 'package:reelhub/data/models/trending_item_model.dart';

abstract class TrendingRepository {
  Future<List<TrendingItem>> getTrending();
}
