part of 'top_rated_movies_bloc.dart';

enum TopRatedMoviesStatus { initial, loading, success, failure }

final class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState({
    this.status = TopRatedMoviesStatus.initial,
    this.errorMessage,
    this.items,
  });

  final TopRatedMoviesStatus status;
  final String? errorMessage;
  final List<Media>? items;

  TopRatedMoviesState copyWith({
    TopRatedMoviesStatus? status,
    String? errorMessage,
    List<Media>? items,
  }) {
    return TopRatedMoviesState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, items];
}
