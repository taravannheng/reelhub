part of 'casts_bloc.dart';

sealed class CastEvent extends Equatable {
  const CastEvent();
}

final class CastFetched extends CastEvent {
  final String id;
  final bool isMovie;

  const CastFetched(this.id, {this.isMovie = true});

  @override
  List<Object> get props => [id, isMovie];
}
