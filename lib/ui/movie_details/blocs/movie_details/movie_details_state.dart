part of 'movie_details_bloc.dart';

enum MovieDetailsStatus { initial, loading, success, failure }

final class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.status = MovieDetailsStatus.initial,
    this.errorMessage,
    this.item,
  });

  final MovieDetailsStatus status;
  final String? errorMessage;
  final MovieDetails? item;

  MovieDetailsState copyWith({
    MovieDetailsStatus? status,
    String? errorMessage,
    MovieDetails? item,
  }) {
    return MovieDetailsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      item: item ?? this.item,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, item];
}
