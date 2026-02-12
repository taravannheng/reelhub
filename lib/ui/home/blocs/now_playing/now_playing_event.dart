part of 'now_playing_bloc.dart';

sealed class NowPlayingEvent extends Equatable {
  const NowPlayingEvent();
}

final class NowPlayingFetched extends NowPlayingEvent {
  const NowPlayingFetched();

  @override
  List<Object> get props => [];
}