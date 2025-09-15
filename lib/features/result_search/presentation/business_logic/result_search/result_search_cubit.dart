import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:safarni/features/result_search/data/models/result_item_model.dart';
import 'package:safarni/features/result_search/data/repos/results_search_repo.dart';
part 'result_search_state.dart';

class ResultSearchCubit extends Cubit<ResultSearchState> {
  ResultSearchCubit() : super(ResultSearchInitial());

  ResultsSearchRepo resultsSearchRepo=ResultsSearchRepo();
  bool isFavourite=false;
  getAllSearchTours(){
    try {
      emit(ResultSearchLoading());
      resultsSearchRepo.getAvailableTours().then((tours){
        emit(ResultSearchLoaded(results: tours));
      });
    }  catch (e) {
      emit(ResultSearchError(error: e.toString()));
    }

  }




  // void toggleFavourite(ResultItemModel tour, BuildContext context) {
  //   final favCubit = BlocProvider.of<FavouriteCubit>(context);
  //   favCubit.toggleFavourite(tour as FavouriteModel);
  //
  //   // كمان نعمل تحديث بسيط محلي في search list عشان الايقونة تلون
  //   final currentState = state;
  //   if (currentState is ResultSearchLoaded) {
  //     final updatedResults = currentState.results.map((item) {
  //       if (item.id == tour.id) {
  //         return item.copyWith(isFavourite: !item.isFavourite);
  //       }
  //       return item;
  //     }).toList();
  //     emit(ResultSearchLoaded(results: updatedResults));
  //   }

  // favouriteSelected(bool isFavourite){
  //   this.isFavourite=isFavourite;
  //   emit(ResultIsFavourite(isFavourite: isFavourite));
  // }






}
