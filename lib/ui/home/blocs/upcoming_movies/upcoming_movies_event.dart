part of 'upcoming_movies_bloc.dart';

sealed class UpcomingMoviesEvent extends Equatable {
  const UpcomingMoviesEvent();
}

final class UpcomingMoviesFetched extends UpcomingMoviesEvent {
  const UpcomingMoviesFetched();

  @override
  List<Object> get props => [];
}
