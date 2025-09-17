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






}
