import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reelhub/data/models/media/media_model.dart';
import 'package:reelhub/data/repositories/movie/movie_repository.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final MovieRepository repository;

  NowPlayingBloc(this.repository) : super(const NowPlayingState()) {
    on<NowPlayingFetched>(_onNowPlayingFetched);
  }

  Future<void> _onNowPlayingFetched(
    NowPlayingFetched event,
    Emitter<NowPlayingState> emit,
  ) async {
    emit(state.copyWith(status: NowPlayingStatus.loading, errorMessage: null));

    try {
      final result = await repository.getNowPlaying();
      emit(
        state.copyWith(
          status: NowPlayingStatus.success,
          items: result,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: NowPlayingStatus.failure,
          errorMessage: e.toString(),
          items: null,
        ),
      );
    }
  }
}
