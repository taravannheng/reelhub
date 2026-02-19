import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reelhub/data/models/movie/movie_model.dart';
import 'package:reelhub/data/repositories/movie/movie_repository.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final MovieRepository repository;

  PopularMoviesBloc(this.repository) : super(const PopularMoviesState()) {
    on<PopularMoviesFetched>(_onPopularMoviesFetched);
  }

  Future<void> _onPopularMoviesFetched(
    PopularMoviesFetched event,
    Emitter<PopularMoviesState> emit,
  ) async {
    emit(state.copyWith(status: PopularMoviesStatus.loading, errorMessage: null));

    try {
      final result = await repository.getPopular();
      emit(
        state.copyWith(
          status: PopularMoviesStatus.success,
          items: result,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: PopularMoviesStatus.failure,
          errorMessage: e.toString(),
          items: null,
        ),
      );
    }
  }
}
