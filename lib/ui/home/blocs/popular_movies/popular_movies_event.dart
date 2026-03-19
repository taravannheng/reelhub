part of 'popular_movies_bloc.dart';

sealed class PopularMoviesEvent extends Equatable {
  const PopularMoviesEvent();
}

final class PopularMoviesFetched extends PopularMoviesEvent {
  const PopularMoviesFetched();

  @override
  List<Object> get props => [];
}