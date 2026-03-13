import 'package:reelhub/data/models/media/media_model.dart';
import 'package:reelhub/data/models/person/person_model.dart';

abstract class PersonDetailsRepository {
  Future<Person?> getDetails(int imdbId);
  Future<List<Media>?> getMovies(String imdbId);
}
