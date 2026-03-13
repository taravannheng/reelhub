import 'package:reelhub/data/models/media/media_model.dart';
import 'package:reelhub/data/models/person/person_model.dart';
import 'package:reelhub/data/repositories/person_details/person_details_repository.dart';
import 'package:reelhub/data/services/tmdb_service.dart';

class PersonDetailsRepositoryImpl implements PersonDetailsRepository {
  final TmdbService _tmdb;

  PersonDetailsRepositoryImpl(this._tmdb);

  @override
  Future<Person?> getDetails(int imdbId) {
    return _tmdb.getPersonDetailsByImdbId(imdbId);
  }

  @override
  Future<List<Media>?> getMovies(String imdbId) {
    return _tmdb.getPersonMovies(imdbId);
  }
}
