import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reelhub/data/models/trending_item_model.dart';
import 'package:reelhub/data/repositories/trending/trending_repository.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final TrendingRepository repository;

  TrendingBloc(this.repository) : super(const TrendingState()) {
    on<TrendingFetched>(_onTrendingFetched);
  }

  Future<void> _onTrendingFetched(
    TrendingFetched event,
    Emitter<TrendingState> emit,
  ) async {
    emit(state.copyWith(status: TrendingStatus.loading, errorMessage: null));

    try {
      final result = await repository.getTrending();
      emit(
        state.copyWith(
          status: TrendingStatus.success,
          items: result,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TrendingStatus.failure,
          errorMessage: e.toString(),
          items: null,
        ),
      );
    }
  }
}
