import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:safarni/features/home/data/models/recommended_tour_model.dart';
import 'package:safarni/features/home/data/repos/recommend_tours_repo.dart';

part 'recommended_tours_state.dart';

class RecommendedToursCubit extends Cubit<RecommendedToursState> {
  RecommendedToursCubit() : super(RecommendedToursInitial());
  RecommendToursRepo recommendToursRepo= RecommendToursRepo();
  List<RecommendedTourModel> recommendedTours=[];

List<RecommendedTourModel> getRecommendedTours(){
    try{
      recommendToursRepo.getAllRecommendedTours().then((tours){
        emit(RecommendedToursLoaded(tours: tours));
        recommendedTours=tours ;
      },
      );
      return recommendedTours;
    } catch(e){
      emit(RecommendedToursError(error: e.toString()));
      return [];
        }
  }





}
