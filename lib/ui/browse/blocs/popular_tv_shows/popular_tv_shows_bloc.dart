import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reelhub/data/models/media/media_model.dart';
import 'package:reelhub/data/repositories/tv/tv_repository.dart';

part 'popular_tv_shows_event.dart';
part 'popular_tv_shows_state.dart';

class PopularTVShowsBloc extends Bloc<PopularTVShowsEvent, PopularTVShowsState> {
  final TvRepository repository;

  PopularTVShowsBloc(this.repository) : super(const PopularTVShowsState()) {
    on<PopularTVShowsFetched>(_onPopularTVShowsFetched);
  }

  Future<void> _onPopularTVShowsFetched(
    PopularTVShowsFetched event,
    Emitter<PopularTVShowsState> emit,
  ) async {
    emit(state.copyWith(status: PopularTVShowsStatus.loading, errorMessage: null));

    try {
      final result = await repository.getPopular();
      emit(
        state.copyWith(
          status: PopularTVShowsStatus.success,
          items: result,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: PopularTVShowsStatus.failure,
          errorMessage: e.toString(),
          items: null,
        ),
      );
    }
  }
}
