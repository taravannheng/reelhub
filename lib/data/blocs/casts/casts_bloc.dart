import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reelhub/data/models/cast/cast_model.dart';
import 'package:reelhub/data/repositories/cast/cast_repository.dart';

part 'casts_event.dart';
part 'casts_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final CastRepository repository;

  CastBloc(this.repository) : super(const CastState()) {
    on<CastFetched>(_onCastFetched);
  }

  Future<void> _onCastFetched(
    CastFetched event,
    Emitter<CastState> emit,
  ) async {
    emit(state.copyWith(status: CastStatus.loading, errorMessage: null));

    try {
      final results = await repository.getCasts(
        event.id,
        isMovie: event.isMovie,
      );

      if (results != null) {
        // filter for actors/actress only
        final filteredResults = results
            .where((item) => item.knownForDepartment == "Acting")
            .toList();

        emit(
          state.copyWith(
            status: CastStatus.success,
            items: filteredResults,
            errorMessage: null,
          ),
        );

        return;
      }

      emit(
        state.copyWith(
          status: CastStatus.success,
          errorMessage: null,
          items: [],
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: CastStatus.failure,
          errorMessage: e.toString(),
          items: null,
        ),
      );
    }
  }
}
