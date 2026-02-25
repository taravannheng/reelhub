part of 'trailers_bloc.dart';

sealed class TrailerEvent extends Equatable {
  const TrailerEvent();
}

final class TrailerFetched extends TrailerEvent {
  final String id;
  final bool isMovie;

  const TrailerFetched(this.id, {this.isMovie = true});

  @override
  List<Object> get props => [id, isMovie];
}
