part of 'popular_bloc.dart';

sealed class PopularEvent extends Equatable {
  const PopularEvent();
}

final class PopularFetched extends PopularEvent {
  const PopularFetched();

  @override
  List<Object> get props => [];
}