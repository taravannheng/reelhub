part of 'popular_tv_shows_bloc.dart';

sealed class PopularTVShowsEvent extends Equatable {
  const PopularTVShowsEvent();
}

final class PopularTVShowsFetched extends PopularTVShowsEvent {
  const PopularTVShowsFetched();

  @override
  List<Object> get props => [];
}