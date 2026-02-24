import 'package:reelhub/data/models/media/media_model.dart';
import 'package:reelhub/data/repositories/trending/trending_repository.dart';
import 'package:reelhub/data/services/tmdb_service.dart';

class TrendingRepositoryImpl implements TrendingRepository {
  final TmdbService _tmdb;

  TrendingRepositoryImpl(this._tmdb);

  @override
  Future<List<Media>> getTrending() {
    return _tmdb.getTrending();
  }
}
