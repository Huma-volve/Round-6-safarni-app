import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/features/internal_tour/domain/use_cases/get_tours_use_case.dart';
import 'package:safarni/features/internal_tour/presentation/cubit/tour_state.dart';

class TourCubit extends Cubit<TourState> {
  final GetTourUseCase usecase;
  TourCubit(this.usecase) : super(TourInitial());

  Future<void> fetchTours({String? searchQuery}) async {
    emit(TourLoading());
    try {
      final tours = await usecase.featchTour();
      emit(TourLoaded(tours));
    } catch (e) {
      emit(TourError('error: $e'));
    }
  }
}
