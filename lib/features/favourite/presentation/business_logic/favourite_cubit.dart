import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:safarni/features/favourite/data/models/favourite_model.dart';
import 'package:safarni/features/favourite/data/repos/favourites_repo.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteLoading());

  FavouritesRepo favouritesRepo=FavouritesRepo();

  getAllFavourites(){
    try{
      emit(FavouriteLoading());
      favouritesRepo.getAllFavourites().then((favourites){
        emit(FavouriteLoaded(favourites: favourites));
      }) ;
    }catch(e){
      emit(FavouriteError(error: e.toString()));
    }


  }



}
