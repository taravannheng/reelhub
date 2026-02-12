part of 'upcoming_movies_bloc.dart';

enum UpcomingMoviesStatus { initial, loading, success, failure }

final class UpcomingMoviesState extends Equatable {
  const UpcomingMoviesState({
    this.status = UpcomingMoviesStatus.initial,
    this.errorMessage,
    this.items,
  });

  final UpcomingMoviesStatus status;
  final String? errorMessage;
  final List<Movie>? items;

  UpcomingMoviesState copyWith({
    UpcomingMoviesStatus? status,
    String? errorMessage,
    List<Movie>? items,
  }) {
    return UpcomingMoviesState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, items];
}
