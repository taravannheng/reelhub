part of 'person_details_bloc.dart';

enum PersonDetailsStatus { initial, loading, success, failure }

final class PersonDetailsState extends Equatable {
  const PersonDetailsState({
    this.status = PersonDetailsStatus.initial,
    this.errorMessage,
    this.item,
  });

  final PersonDetailsStatus status;
  final String? errorMessage;
  final Person? item;

  PersonDetailsState copyWith({
    PersonDetailsStatus? status,
    String? errorMessage,
    Person? item,
  }) {
    return PersonDetailsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      item: item ?? this.item,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, item];
}
