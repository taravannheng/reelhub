import 'package:flutter/material.dart';
import 'package:reelhub/data/models/movie_details/movie_details_model.dart';
import 'package:reelhub/ui/movie_details/views/genre_list.dart';
import 'package:reelhub/ui/movie_details/views/meta_list.dart';

class MovieDetailsOverview extends StatelessWidget {
  final MovieDetails? movieDetails;

  const MovieDetailsOverview(this.movieDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    if (movieDetails == null) return Text("No data...");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movieDetails!.title,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        GenreList(genres: movieDetails?.genres),
        MetaList(
          adult: movieDetails?.adult,
          popularity: movieDetails?.popularity ?? 0,
          language: movieDetails?.originalLanguage,
        ),
        const SizedBox(height: 24.0),
        Text(
          movieDetails?.overview ?? "No overview...",
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
