import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reelhub/data/models/person/person_model.dart';
import 'package:reelhub/data/repositories/person_details/person_details_repository.dart';

part 'person_details_event.dart';
part 'person_details_state.dart';

class PersonDetailsBloc extends Bloc<PersonDetailsEvent, PersonDetailsState> {
  final PersonDetailsRepository repository;

  PersonDetailsBloc(this.repository) : super(const PersonDetailsState()) {
    on<PersonDetailsFetched>(_onPersonDetailsFetched);
  }

  Future<void> _onPersonDetailsFetched(
    PersonDetailsFetched event,
    Emitter<PersonDetailsState> emit,
  ) async {
    emit(
      state.copyWith(status: PersonDetailsStatus.loading, errorMessage: null),
    );

    try {
      final result = await repository.getDetails(event.imdbId);
      emit(
        state.copyWith(
          status: PersonDetailsStatus.success,
          item: result,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: PersonDetailsStatus.failure,
          errorMessage: "Failed to fetch person details...",
          item: null,
        ),
      );
    }
  }
}
