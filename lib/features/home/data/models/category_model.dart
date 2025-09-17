import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_routes.dart';

class CategoryModel{

  final String title;
  final String route;
  final String image;

  const CategoryModel({
    required this.title,
    required this.route,
    required this.image,
  });
}

List<CategoryModel> categoriesList = [

  CategoryModel(title:'Flight' , route: AppRoutes.flightBookingRouteName, image: AppImages.homeFlightPhoto),
  CategoryModel(title:'Car' , route: AppRoutes.carbooking ,image:AppImages.homeCarPhoto),
  CategoryModel(title:'Tour' , route: AppRoutes.internalTour, image: AppImages.homeTourPhoto),
  CategoryModel(title:'Hotel' , route: AppRoutes.hotelBooking, image: AppImages.homeHotelPhoto),


];
