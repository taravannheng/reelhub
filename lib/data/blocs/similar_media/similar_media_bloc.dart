import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reelhub/data/models/media/media_model.dart';
import 'package:reelhub/data/repositories/movie/movie_repository.dart';
import 'package:reelhub/data/repositories/tv/tv_repository.dart';

part 'similar_media_event.dart';
part 'similar_media_state.dart';

class SimilarMediaBloc extends Bloc<SimilarMediaEvent, SimilarMediaState> {
  final MovieRepository movieRepository;
  final TvRepository tvRepository;

  SimilarMediaBloc(this.movieRepository, this.tvRepository)
    : super(const SimilarMediaState()) {
    on<SimilarMediaFetched>(_onSimilarMediaFetched);
  }

  Future<void> _onSimilarMediaFetched(
    SimilarMediaFetched event,
    Emitter<SimilarMediaState> emit,
  ) async {
    emit(
      state.copyWith(status: SimilarMediaStatus.loading, errorMessage: null),
    );

    try {
      final results = event.isMovie
          ? await movieRepository.getSimilar(event.id)
          : await tvRepository.getSimilar(event.id);

      emit(
        state.copyWith(
          status: SimilarMediaStatus.success,
          items: results,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SimilarMediaStatus.failure,
          errorMessage: e.toString(),
          items: null,
        ),
      );
    }
  }
}
