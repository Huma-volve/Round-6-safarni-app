import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:safarni/features/home/data/models/available_tour_model.dart';
import 'package:safarni/features/home/data/repos/available_tour_repo.dart';

part 'available_tours_state.dart';

class AvailableToursCubit extends Cubit<AvailableToursState> {
  AvailableToursCubit() : super(AvailableToursLoading());

  AvailableTourRepo availableTourRepo=AvailableTourRepo();
  List<AvailableTourModel> availableTours=[];

  getAllAvailableTours(){
    try {
      emit(AvailableToursLoading());
      availableTourRepo.getAvailableTours().then((tours){
        emit(AvailableToursLoaded(availableTours: tours));
        availableTours=tours;
      });
      return availableTours;
    }  catch (e) {
      emit(AvailableToursError(error: e.toString()));
    }

  }

}
