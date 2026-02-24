import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reelhub/data/models/media/media_model.dart';
import 'package:reelhub/data/repositories/movie/movie_repository.dart';

part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final MovieRepository repository;

  TopRatedMoviesBloc(this.repository) : super(const TopRatedMoviesState()) {
    on<TopRatedMoviesFetched>(_onTopRatedMoviesFetched);
  }

  Future<void> _onTopRatedMoviesFetched(
    TopRatedMoviesFetched event,
    Emitter<TopRatedMoviesState> emit,
  ) async {
    emit(state.copyWith(status: TopRatedMoviesStatus.loading, errorMessage: null));

    try {
      final result = await repository.getTopRated();
      emit(
        state.copyWith(
          status: TopRatedMoviesStatus.success,
          items: result,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TopRatedMoviesStatus.failure,
          errorMessage: e.toString(),
          items: null,
        ),
      );
    }
  }
}
