import 'package:reelhub/data/models/movie_model.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TmdbService {
  final TMDB _tmdb;

  TmdbService(this._tmdb);

  Future<List<Movie>> getTrending() async {
    final Map<dynamic, dynamic> results = await _tmdb.v3.trending.getTrending(
      mediaType: MediaType.all,
      timeWindow: TimeWindow.day,
    );

    final trendingList = (results["results"] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .map((item) => Movie.fromJson(item))
        .toList();

    return trendingList;
  }
}
