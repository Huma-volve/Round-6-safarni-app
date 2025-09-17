import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:safarni/features/favourite/data/models/favourite_model.dart';
import 'package:safarni/features/favourite/data/repos/favourites_repo.dart';
part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteLoading());

  final FavouritesRepo favouritesRepo = FavouritesRepo();
  List<FavouriteModel> favourites = [];

  Future<void> getAllFavourites() async {
    try {
      emit(FavouriteLoading());
      favourites = await favouritesRepo.getAllFavourites();
      emit(FavouriteLoaded(favourites: favourites));
    } catch (e) {
      emit(FavouriteError(error: e.toString()));
    }
  }

  Future<void> addToFavourites(FavouriteModel tour) async {
    try {
      await favouritesRepo.addToFavourites(tour.id);
      favourites.add(tour);
      emit(FavouriteLoaded(favourites: favourites));
    } catch (e) {
      emit(FavouriteError(error: e.toString()));
    }
  }

  Future<void> removeFromFavourites(int tourId) async{
    try {
      await favouritesRepo.removeFromFavourites(tourId);
      favourites.removeWhere((item) => item.id == tourId);
      emit(FavouriteLoaded(favourites: favourites));
    } catch (e) {
      emit(FavouriteError(error: e.toString()));
    }
  }

  Future<void> toggleFavourite(FavouriteModel tour) async {
    final isFav = favourites.any((item) => item.id == tour.id);
    if (isFav) {
      await removeFromFavourites(tour.id);
    } else {
      await addToFavourites(tour);
    }
  }



}



