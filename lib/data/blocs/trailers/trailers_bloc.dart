import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reelhub/data/models/trailer/trailer_model.dart';
import 'package:reelhub/data/repositories/trailer/trailer_repository.dart';

part 'trailers_event.dart';
part 'trailers_state.dart';

class TrailerBloc extends Bloc<TrailerEvent, TrailerState> {
  final TrailerRepository repository;

  TrailerBloc(this.repository) : super(const TrailerState()) {
    on<TrailerFetched>(_onTrailerFetched);
  }

  Future<void> _onTrailerFetched(
    TrailerFetched event,
    Emitter<TrailerState> emit,
  ) async {
    emit(state.copyWith(status: TrailerStatus.loading, errorMessage: null));

    try {
      final results = await repository.getTrailers(
        event.id,
        isMovie: event.isMovie,
      );

      // filter for youtube videos only
      final filteredResults = results
          .where((item) => item.site == "YouTube")
          .toList();

      emit(
        state.copyWith(
          status: TrailerStatus.success,
          items: filteredResults,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TrailerStatus.failure,
          errorMessage: e.toString(),
          items: null,
        ),
      );
    }
  }
}
