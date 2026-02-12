part of 'top_rated_movies_bloc.dart';

sealed class TopRatedMoviesEvent extends Equatable {
  const TopRatedMoviesEvent();
}

final class TopRatedMoviesFetched extends TopRatedMoviesEvent {
  const TopRatedMoviesFetched();

  @override
  List<Object> get props => [];
}