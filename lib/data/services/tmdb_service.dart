import 'package:tmdb_api/tmdb_api.dart';

class TmdbService {
  final TMDB _tmdb;

  TmdbService(this._tmdb);

  Future<Map> getTrending() {
    return _tmdb.v3.trending.getTrending(
      mediaType: MediaType.all,
      timeWindow: TimeWindow.day,
    );
  }
}
