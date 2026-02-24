part of 'casts_bloc.dart';

sealed class CastEvent extends Equatable {
  const CastEvent();
}

final class CastFetched extends CastEvent {
  final String movieId;

  const CastFetched(this.movieId);

  @override
  List<Object> get props => [movieId];
}
