part of 'popular_bloc.dart';

enum PopularStatus { initial, loading, success, failure }

final class PopularState extends Equatable {
  const PopularState({
    this.status = PopularStatus.initial,
    this.errorMessage,
    this.items,
  });

  final PopularStatus status;
  final String? errorMessage;
  final List<Movie>? items;

  PopularState copyWith({
    PopularStatus? status,
    String? errorMessage,
    List<Movie>? items,
  }) {
    return PopularState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, items];
}
