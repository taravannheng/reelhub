part of 'similar_media_bloc.dart';

enum SimilarMediaStatus { initial, loading, success, failure }

final class SimilarMediaState extends Equatable {
  const SimilarMediaState({
    this.status = SimilarMediaStatus.initial,
    this.errorMessage,
    this.items,
  });

  final SimilarMediaStatus status;
  final String? errorMessage;
  final List<Media>? items;

  SimilarMediaState copyWith({
    SimilarMediaStatus? status,
    String? errorMessage,
    List<Media>? items,
  }) {
    return SimilarMediaState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, items];
}
