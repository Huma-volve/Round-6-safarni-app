import 'package:safarni/core/constant/assets.dart';

class FurnitureModel {
  final String name;
  final String image;

  FurnitureModel({required this.name, required this.image});
  static List<FurnitureModel> furniture = [
    FurnitureModel(name: '3Beds', image: Assets.imagesBeds),
    FurnitureModel(name: '2 Bath', image: Assets.imagesBath),
    FurnitureModel(name: '1.848 Sqrt', image: Assets.imagesSqrt),
  ];
}
