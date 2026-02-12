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
  final List<Movie>? items;

  TopRatedMoviesState copyWith({
    TopRatedMoviesStatus? status,
    String? errorMessage,
    List<Movie>? items,
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
