part of 'similar_movies_bloc.dart';

enum SimilarMovieStatus { initial, loading, success, failure }

final class SimilarMovieState extends Equatable {
  const SimilarMovieState({
    this.status = SimilarMovieStatus.initial,
    this.errorMessage,
    this.items,
  });

  final SimilarMovieStatus status;
  final String? errorMessage;
  final List<Movie>? items;

  SimilarMovieState copyWith({
    SimilarMovieStatus? status,
    String? errorMessage,
    List<Movie>? items,
  }) {
    return SimilarMovieState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, items];
}
