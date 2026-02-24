import 'package:reelhub/data/models/trailer/trailer_model.dart';
import 'package:reelhub/data/repositories/trailer/trailer_repository.dart';
import 'package:reelhub/data/services/tmdb_service.dart';

class TrailerRepositoryImpl implements TrailerRepository {
  final TmdbService _tmdb;

  TrailerRepositoryImpl(this._tmdb);

  @override
  Future<List<Trailer>> getTrailers(String id) {
    return _tmdb.getTrailers(id);
  }
}
