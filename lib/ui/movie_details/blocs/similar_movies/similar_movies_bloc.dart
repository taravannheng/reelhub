import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reelhub/data/models/media/media_model.dart';
import 'package:reelhub/data/repositories/movie/movie_repository.dart';


part 'similar_movies_event.dart';
part 'similar_movies_state.dart';

class SimilarMovieBloc extends Bloc<SimilarMovieEvent, SimilarMovieState> {
  final MovieRepository repository;

  SimilarMovieBloc(this.repository) : super(const SimilarMovieState()) {
    on<SimilarMovieFetched>(_onSimilarMovieFetched);
  }

  Future<void> _onSimilarMovieFetched(
    SimilarMovieFetched event,
    Emitter<SimilarMovieState> emit,
  ) async {
    emit(state.copyWith(status: SimilarMovieStatus.loading, errorMessage: null));

    try {
      final results = await repository.getSimilarMovies(event.movieId);

      emit(
        state.copyWith(
          status: SimilarMovieStatus.success,
          items: results,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SimilarMovieStatus.failure,
          errorMessage: e.toString(),
          items: null,
        ),
      );
    }
  }
}
