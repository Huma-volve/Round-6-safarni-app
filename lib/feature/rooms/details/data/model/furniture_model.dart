import 'package:safarni/core/constant/assets.dart';

class FurnitureModel {
  final String name;
  final String image;

  FurnitureModel({required this.name, required this.image});
  static List<FurnitureModel> furniture = [
    FurnitureModel(name: '3Beds', image: Assets.iconsBeds),
    FurnitureModel(name: '2 Bath', image: Assets.iconsBath),
    FurnitureModel(name: '1.848 Sqrt', image: Assets.iconsSqrt),
  ];
}
