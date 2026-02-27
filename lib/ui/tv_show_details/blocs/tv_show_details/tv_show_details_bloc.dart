import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reelhub/data/models/tv_show/tv_show_model.dart';
import 'package:reelhub/data/repositories/tv/tv_repository.dart';

part 'tv_show_details_event.dart';
part 'tv_show_details_state.dart';

class TvShowDetailsBloc extends Bloc<TvShowDetailsEvent, TvShowDetailsState> {
  final TvRepository repository;

  TvShowDetailsBloc(this.repository) : super(const TvShowDetailsState()) {
    on<TvShowDetailsFetched>(_onTvShowDetailsFetched);
  }

  Future<void> _onTvShowDetailsFetched(
    TvShowDetailsFetched event,
    Emitter<TvShowDetailsState> emit,
  ) async {
    emit(
      state.copyWith(status: TvShowDetailsStatus.loading, errorMessage: null),
    );

    try {
      final result = await repository.getDetails(event.tvShowId);
      emit(
        state.copyWith(
          status: TvShowDetailsStatus.success,
          item: result,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TvShowDetailsStatus.failure,
          errorMessage: "Failed to fetch TV show details...",
          item: null,
        ),
      );
    }
  }
}
