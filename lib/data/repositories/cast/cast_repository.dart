import 'package:reelhub/data/models/cast/cast_model.dart';

abstract class CastRepository {
  Future<List<Cast>?> getCasts(String id);
}
