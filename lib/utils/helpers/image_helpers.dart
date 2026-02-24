import 'package:reelhub/utils/enums/backdrop_size_enums.dart';
import 'package:reelhub/utils/enums/poster_size_enums.dart';
import 'package:reelhub/utils/enums/profile_size_enums.dart';

class ImageHelpers {
  static String formatPosterUrl(String? path, {PosterSize size = PosterSize.original}) {
    final String baseUrl = "https://image.tmdb.org/t/p/${size.value}";

    if (path == null || path.isEmpty) return '';

    return '$baseUrl$path';
  }

  static String formatBackdropUrl(String? path, {BackdropSize size = BackdropSize.original}) {
    final String baseUrl = "https://image.tmdb.org/t/p/${size.value}";

    if (path == null || path.isEmpty) return '';

    return '$baseUrl$path';
  }

  static String formatProfileUrl(String? path, {ProfileSize size = ProfileSize.original}) {
    final String baseUrl = "https://image.tmdb.org/t/p/${size.value}";

    if (path == null || path.isEmpty) return '';

    return '$baseUrl$path';
  }
}
