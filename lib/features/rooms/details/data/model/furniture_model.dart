import 'package:safarni/core/constants/app_icons.dart';

class FurnitureModel {
  final String name;
  final String image;

  FurnitureModel({required this.name, required this.image});
  static List<FurnitureModel> furniture = [
    FurnitureModel(name: 'Beds', image: AppIcons.iconsBeds),
    FurnitureModel(name: 'Bath', image: AppIcons.iconsBath),
    FurnitureModel(name: 'Sqrt', image: AppIcons.iconsSqrt),
  ];
}
