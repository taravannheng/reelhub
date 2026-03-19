part of 'popular_tv_shows_bloc.dart';

enum PopularTVShowsStatus { initial, loading, success, failure }

final class PopularTVShowsState extends Equatable {
  const PopularTVShowsState({
    this.status = PopularTVShowsStatus.initial,
    this.errorMessage,
    this.items,
  });

  final PopularTVShowsStatus status;
  final String? errorMessage;
  final List<Media>? items;

  PopularTVShowsState copyWith({
    PopularTVShowsStatus? status,
    String? errorMessage,
    List<Media>? items,
  }) {
    return PopularTVShowsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, items];
}
