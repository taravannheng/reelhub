import 'package:reelhub/data/models/movie_model.dart';

abstract class TrendingRepository {
  Future<List<Movie>> getTrending();
}
