import 'package:reelhub/data/models/media/media_model.dart';
import 'package:reelhub/data/models/tv_show/tv_show_model.dart';
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

  @override
  Future<TvShow?> getDetails(int id) {
    return _tmdb.getTvShowDetails(id);
  }

  @override
  Future<List<Media>?> getSimilar(int id) {
    return _tmdb.getSimilar(id, isMovie: false);
  }
}
