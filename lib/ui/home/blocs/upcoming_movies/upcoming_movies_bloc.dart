import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reelhub/data/models/movie_model.dart';
import 'package:reelhub/data/repositories/movie/movie_repository.dart';

part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final MovieRepository repository;

  UpcomingMoviesBloc(this.repository) : super(const UpcomingMoviesState()) {
    on<UpcomingMoviesFetched>(_onUpcomingFetched);
  }

  Future<void> _onUpcomingFetched(
    UpcomingMoviesFetched event,
    Emitter<UpcomingMoviesState> emit,
  ) async {
    emit(
      state.copyWith(status: UpcomingMoviesStatus.loading, errorMessage: null),
    );

    try {
      final result = await repository.getUpcoming();
      emit(
        state.copyWith(
          status: UpcomingMoviesStatus.success,
          items: result,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: UpcomingMoviesStatus.failure,
          errorMessage: e.toString(),
          items: null,
        ),
      );
    }
  }
}
