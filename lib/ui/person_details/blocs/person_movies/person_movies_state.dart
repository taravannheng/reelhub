part of 'person_movies_bloc.dart';

enum PersonMoviesStatus { initial, loading, success, failure }

final class PersonMoviesState extends Equatable {
  const PersonMoviesState({
    this.status = PersonMoviesStatus.initial,
    this.errorMessage,
    this.items,
  });

  final PersonMoviesStatus status;
  final String? errorMessage;
  final List<Media>? items;

  PersonMoviesState copyWith({
    PersonMoviesStatus? status,
    String? errorMessage,
    List<Media>? items,
  }) {
    return PersonMoviesState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, items];
}
