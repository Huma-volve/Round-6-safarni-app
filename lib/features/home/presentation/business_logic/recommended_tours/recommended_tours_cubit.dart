import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:safarni/features/home/data/models/category_model.dart';
import 'package:safarni/features/home/data/models/recommended_tour_model.dart';
import 'package:safarni/features/home/data/repos/recommend_tours_repo.dart';

part 'recommended_tours_state.dart';

class RecommendedToursCubit extends Cubit<RecommendedToursState> {
  RecommendedToursCubit() : super(RecommendedToursLoading());
  RecommendToursRepo recommendToursRepo = RecommendToursRepo();

  Future<void> getRecommendedTours()async {
    try {
      emit(RecommendedToursLoading());
    final tours= await recommendToursRepo.getAllRecommendedTours();
        emit(RecommendedToursLoaded(tours: tours));

    } catch (e) {
      emit(RecommendedToursError(error: e.toString()));
    }
  }

 void getCategories() async {
    emit(CategoriesLoading());
    await Future.delayed(const Duration(seconds: 1), () {
      emit(CategoriesLoaded(categories: categoriesList));
    });
  }
}
