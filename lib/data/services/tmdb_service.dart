import 'package:reelhub/data/models/trending_item_model.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TmdbService {
  final TMDB _tmdb;

  TmdbService(this._tmdb);

  Future<List<TrendingItem>> getTrending() async {
    final Map<dynamic, dynamic> results = await _tmdb.v3.trending.getTrending(
      mediaType: MediaType.all,
      timeWindow: TimeWindow.day,
    );

    final trendingList = (results["results"] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .map((item) => TrendingItem.fromJson(item))
        .toList();

    return trendingList;
  }
}
