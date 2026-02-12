part of 'popular_movies_bloc.dart';

enum PopularMoviesStatus { initial, loading, success, failure }

final class PopularMoviesState extends Equatable {
  const PopularMoviesState({
    this.status = PopularMoviesStatus.initial,
    this.errorMessage,
    this.items,
  });

  final PopularMoviesStatus status;
  final String? errorMessage;
  final List<Movie>? items;

  PopularMoviesState copyWith({
    PopularMoviesStatus? status,
    String? errorMessage,
    List<Movie>? items,
  }) {
    return PopularMoviesState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, items];
}
