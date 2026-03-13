part of 'person_movies_bloc.dart';

sealed class PersonMoviesEvent extends Equatable {
  const PersonMoviesEvent();
}

final class PersonMoviesFetched extends PersonMoviesEvent {
  final String id;
  final bool isMovie;

  const PersonMoviesFetched(this.id, {this.isMovie = true});

  @override
  List<Object> get props => [id, isMovie];
}

final class PersonMoviesFailed extends PersonMoviesEvent {
  const PersonMoviesFailed();

  @override
  List<Object> get props => [];
}
