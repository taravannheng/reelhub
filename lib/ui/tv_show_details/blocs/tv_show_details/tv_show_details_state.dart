part of 'tv_show_details_bloc.dart';

enum TvShowDetailsStatus { initial, loading, success, failure }

final class TvShowDetailsState extends Equatable {
  const TvShowDetailsState({
    this.status = TvShowDetailsStatus.initial,
    this.errorMessage,
    this.item,
  });

  final TvShowDetailsStatus status;
  final String? errorMessage;
  final TvShow? item;

  TvShowDetailsState copyWith({
    TvShowDetailsStatus? status,
    String? errorMessage,
    TvShow? item,
  }) {
    return TvShowDetailsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      item: item ?? this.item,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, item];
}
