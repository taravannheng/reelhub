part of 'top_rated_tv_shows_bloc.dart';

enum TopRatedTVShowsStatus { initial, loading, success, failure }

final class TopRatedTVShowsState extends Equatable {
  const TopRatedTVShowsState({
    this.status = TopRatedTVShowsStatus.initial,
    this.errorMessage,
    this.items,
  });

  final TopRatedTVShowsStatus status;
  final String? errorMessage;
  final List<Movie>? items;

  TopRatedTVShowsState copyWith({
    TopRatedTVShowsStatus? status,
    String? errorMessage,
    List<Movie>? items,
  }) {
    return TopRatedTVShowsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, items];
}
