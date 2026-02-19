part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

final class MovieDetailsFetched extends MovieDetailsEvent {
  final String movieId;

  const MovieDetailsFetched(this.movieId);

  @override
  List<Object> get props => [movieId];
}
