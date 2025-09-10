import 'package:safarni/core/constants/app_icons.dart';

class FurnitureModel {
  final String name;
  final String image;

  FurnitureModel({required this.name, required this.image});
  static List<FurnitureModel> furniture = [
    FurnitureModel(name: '3Beds', image: AppIcons.iconsBeds),
    FurnitureModel(name: '2 Bath', image: AppIcons.iconsBath),
    FurnitureModel(name: '1.848 Sqrt', image: AppIcons.iconsSqrt),
  ];
}
