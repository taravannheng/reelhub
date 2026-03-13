part of 'person_details_bloc.dart';

sealed class PersonDetailsEvent extends Equatable {
  const PersonDetailsEvent();
}

final class PersonDetailsFetched extends PersonDetailsEvent {
  final int imdbId;

  const PersonDetailsFetched(this.imdbId);

  @override
  List<Object> get props => [imdbId];
}
