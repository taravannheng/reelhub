part of 'tv_show_details_bloc.dart';

sealed class TvShowDetailsEvent extends Equatable {
  const TvShowDetailsEvent();
}

final class TvShowDetailsFetched extends TvShowDetailsEvent {
  final int tvShowId;

  const TvShowDetailsFetched(this.tvShowId);

  @override
  List<Object> get props => [tvShowId];
}
