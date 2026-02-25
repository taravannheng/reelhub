part of 'casts_bloc.dart';

enum CastStatus { initial, loading, success, failure }

final class CastState extends Equatable {
  const CastState({
    this.status = CastStatus.initial,
    this.errorMessage,
    this.items,
  });

  final CastStatus status;
  final String? errorMessage;
  final List<Cast>? items;

  CastState copyWith({
    CastStatus? status,
    String? errorMessage,
    List<Cast>? items,
  }) {
    return CastState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, items];
}
