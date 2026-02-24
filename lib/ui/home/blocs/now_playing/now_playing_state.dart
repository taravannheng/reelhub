part of 'now_playing_bloc.dart';

enum NowPlayingStatus { initial, loading, success, failure }

final class NowPlayingState extends Equatable {
  const NowPlayingState({
    this.status = NowPlayingStatus.initial,
    this.errorMessage,
    this.items,
  });

  final NowPlayingStatus status;
  final String? errorMessage;
  final List<Media>? items;

  NowPlayingState copyWith({
    NowPlayingStatus? status,
    String? errorMessage,
    List<Media>? items,
  }) {
    return NowPlayingState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, items];
}
