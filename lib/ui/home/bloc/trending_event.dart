part of 'trending_bloc.dart';

sealed class TrendingEvent extends Equatable {
  const TrendingEvent();
}

final class TrendingFetched extends TrendingEvent {
  const TrendingFetched();

  @override
  List<Object> get props => [];
}