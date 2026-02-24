part of 'similar_movies_bloc.dart';

sealed class SimilarMovieEvent extends Equatable {
  const SimilarMovieEvent();
}

final class SimilarMovieFetched extends SimilarMovieEvent {
  final int movieId;

  const SimilarMovieFetched(this.movieId);

  @override
  List<Object> get props => [movieId];
}
