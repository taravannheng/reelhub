import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reelhub/data/models/media/media_model.dart';
import 'package:reelhub/data/repositories/tv/tv_repository.dart';

part 'top_rated_tv_shows_event.dart';
part 'top_rated_tv_shows_state.dart';

class TopRatedTVShowsBloc extends Bloc<TopRatedTVShowsEvent, TopRatedTVShowsState> {
  final TvRepository repository;

  TopRatedTVShowsBloc(this.repository) : super(const TopRatedTVShowsState()) {
    on<TopRatedTVShowsFetched>(_onTopRatedTVShowsFetched);
  }

  Future<void> _onTopRatedTVShowsFetched(
    TopRatedTVShowsFetched event,
    Emitter<TopRatedTVShowsState> emit,
  ) async {
    emit(state.copyWith(status: TopRatedTVShowsStatus.loading, errorMessage: null));

    try {
      final result = await repository.getTopRated();
      emit(
        state.copyWith(
          status: TopRatedTVShowsStatus.success,
          items: result,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TopRatedTVShowsStatus.failure,
          errorMessage: e.toString(),
          items: null,
        ),
      );
    }
  }
}
