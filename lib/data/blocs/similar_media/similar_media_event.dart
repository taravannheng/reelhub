part of 'similar_media_bloc.dart';

sealed class SimilarMediaEvent extends Equatable {
  const SimilarMediaEvent();
}

final class SimilarMediaFetched extends SimilarMediaEvent {
  final int id;
  final bool isMovie;

  const SimilarMediaFetched(this.id, {this.isMovie = true});

  @override
  List<Object> get props => [id, isMovie];
}
