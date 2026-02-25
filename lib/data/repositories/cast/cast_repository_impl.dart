import 'package:reelhub/data/models/cast/cast_model.dart';
import 'package:reelhub/data/repositories/cast/cast_repository.dart';
import 'package:reelhub/data/services/tmdb_service.dart';

class CastRepositoryImpl implements CastRepository {
  final TmdbService _tmdb;

  CastRepositoryImpl(this._tmdb);

  @override
  Future<List<Cast>?> getCasts(String id, {required bool isMovie}) {
    return _tmdb.getCasts(id, isMovie: isMovie);
  }
}
