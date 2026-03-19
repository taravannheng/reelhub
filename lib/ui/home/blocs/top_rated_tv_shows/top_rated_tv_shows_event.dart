part of 'top_rated_tv_shows_bloc.dart';

sealed class TopRatedTVShowsEvent extends Equatable {
  const TopRatedTVShowsEvent();
}

final class TopRatedTVShowsFetched extends TopRatedTVShowsEvent {
  const TopRatedTVShowsFetched();

  @override
  List<Object> get props => [];
}