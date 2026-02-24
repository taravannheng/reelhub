part of 'trending_bloc.dart';

enum TrendingStatus { initial, loading, success, failure }

final class TrendingState extends Equatable {
  const TrendingState({
    this.status = TrendingStatus.initial,
    this.errorMessage,
    this.items,
  });

  final TrendingStatus status;
  final String? errorMessage;
  final List<Media>? items;

  TrendingState copyWith({
    TrendingStatus? status,
    String? errorMessage,
    List<Media>? items,
  }) {
    return TrendingState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, items];
}
