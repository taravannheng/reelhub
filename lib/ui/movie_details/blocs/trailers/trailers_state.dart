part of 'trailers_bloc.dart';

enum TrailerStatus { initial, loading, success, failure }

final class TrailerState extends Equatable {
  const TrailerState({
    this.status = TrailerStatus.initial,
    this.errorMessage,
    this.items,
  });

  final TrailerStatus status;
  final String? errorMessage;
  final List<Trailer>? items;

  TrailerState copyWith({
    TrailerStatus? status,
    String? errorMessage,
    List<Trailer>? items,
  }) {
    return TrailerState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, items];
}
