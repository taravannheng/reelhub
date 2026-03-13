import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reelhub/data/models/media/media_model.dart';
import 'package:reelhub/data/repositories/person_details/person_details_repository.dart';

part 'person_movies_event.dart';
part 'person_movies_state.dart';

class PersonMoviesBloc extends Bloc<PersonMoviesEvent, PersonMoviesState> {
  final PersonDetailsRepository personDetailsRepository;

  PersonMoviesBloc(this.personDetailsRepository)
    : super(const PersonMoviesState()) {
    on<PersonMoviesFetched>(_onPersonMoviesFetched);
    on<PersonMoviesFailed>(_onPersonMoviesFailed);
  }

  Future<void> _onPersonMoviesFetched(
    PersonMoviesFetched event,
    Emitter<PersonMoviesState> emit,
  ) async {
    emit(
      state.copyWith(status: PersonMoviesStatus.loading, errorMessage: null),
    );

    try {
      final results = await personDetailsRepository.getMovies(event.id);

      emit(
        state.copyWith(
          status: PersonMoviesStatus.success,
          items: results,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: PersonMoviesStatus.failure,
          errorMessage: "Failed to fetch person movies...",
          items: null,
        ),
      );
    }
  }

  Future<void> _onPersonMoviesFailed(
    PersonMoviesFailed event,
    Emitter<PersonMoviesState> emit,
  ) async {
    emit(
      state.copyWith(
        status: PersonMoviesStatus.failure,
        items: null,
        errorMessage: "Failed to fetch person movies...",
      ),
    );
  }
}
