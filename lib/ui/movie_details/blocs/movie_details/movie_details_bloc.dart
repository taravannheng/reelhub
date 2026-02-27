import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reelhub/data/models/movie/movie_model.dart';
import 'package:reelhub/data/repositories/movie_details/movie_details_repository.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieDetailsRepository repository;

  MovieDetailsBloc(this.repository) : super(const MovieDetailsState()) {
    on<MovieDetailsFetched>(_onMovieDetailsFetched);
  }

  Future<void> _onMovieDetailsFetched(
    MovieDetailsFetched event,
    Emitter<MovieDetailsState> emit,
  ) async {
    emit(
      state.copyWith(status: MovieDetailsStatus.loading, errorMessage: null),
    );

    try {
      final result = await repository.getMovieDetails(event.movieId);
      emit(
        state.copyWith(
          status: MovieDetailsStatus.success,
          item: result,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MovieDetailsStatus.failure,
          errorMessage: e.toString(),
          item: null,
        ),
      );
    }
  }
}
