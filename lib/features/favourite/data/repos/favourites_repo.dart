import 'package:safarni/features/favourite/data/models/favourite_model.dart';
import 'package:safarni/features/favourite/data/services/favourite_services.dart';

class FavouritesRepo {
  FavouriteServices favouriteServices = FavouriteServices();

  Future<List<FavouriteModel>> getAllFavourites() async {
    final favourites = await favouriteServices.getAllFavourites();
    return favourites.map((favourite) => FavouriteModel.fromJson(favourite)).toList();
  }

  Future<void> addToFavourites(int tourId) async {
    await favouriteServices.addToFavourites(tourId);
  }

  Future<void> removeFromFavourites(int tourId) async {
    await favouriteServices.removeFromFavourites(tourId);
  }
}
