import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reelhub/data/models/movie_model.dart';
import 'package:reelhub/data/repositories/tv/tv_repository.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final TvRepository repository;

  PopularBloc(this.repository) : super(const PopularState()) {
    on<PopularFetched>(_onPopularFetched);
  }

  Future<void> _onPopularFetched(
    PopularFetched event,
    Emitter<PopularState> emit,
  ) async {
    emit(state.copyWith(status: PopularStatus.loading, errorMessage: null));

    try {
      final result = await repository.getPopular();
      emit(
        state.copyWith(
          status: PopularStatus.success,
          items: result,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: PopularStatus.failure,
          errorMessage: e.toString(),
          items: null,
        ),
      );
    }
  }
}
