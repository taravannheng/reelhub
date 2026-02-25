import 'package:reelhub/data/models/trailer/trailer_model.dart';

abstract class TrailerRepository {
  Future<List<Trailer>> getTrailers(String id, {required bool isMovie});
}
