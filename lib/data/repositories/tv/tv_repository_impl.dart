import 'package:reelhub/data/models/media/media_model.dart';
import 'package:reelhub/data/repositories/tv/tv_repository.dart';
import 'package:reelhub/data/services/tmdb_service.dart';

class TvRepositoryImpl implements TvRepository {
  final TmdbService _tmdb;

  TvRepositoryImpl(this._tmdb);

  @override
  Future<List<Media>> getPopular() {
    return _tmdb.getPopularTvShows();
  }

  @override
  Future<List<Media>> getTopRated() {
    return _tmdb.getTopRatedTvShows();
  }
}
