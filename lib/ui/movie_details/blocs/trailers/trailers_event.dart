part of 'trailers_bloc.dart';

sealed class TrailerEvent extends Equatable {
  const TrailerEvent();
}

final class TrailerFetched extends TrailerEvent {
  final String movieId;

  const TrailerFetched(this.movieId);

  @override
  List<Object> get props => [movieId];
}
