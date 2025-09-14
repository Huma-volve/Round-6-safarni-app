import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_images.dart';

class BrandModel {
  final String name;
  final Widget image;
  final String type;

  BrandModel({required this.name, required this.image, required this.type});
}

List<BrandModel> brand = [
  BrandModel(
    name: "Mercedes",
    image: Image.asset(AppImages.mercedes, height: 50),
    type: "+32",
  ),
  BrandModel(
    name: "BMW",
    image: Image.asset(AppIcons.Bmw, height: 50, width: 60),
    type: "+12",
  ),
  BrandModel(
    name: "Mercedes",
    image: Image.asset(AppImages.mercedes, height: 50, width: 60),
    type: "+12",
  ),
  BrandModel(
    name: "BMW",
    image: Image.asset(AppIcons.Bmw, height: 50, width: 60),
    type: "+12",
  ),
  BrandModel(
    name: "Mercedes",
    image: Image.asset(AppImages.mercedes, height: 40),
    type: "+12",
  ),
  BrandModel(
    name: "Renault",
    image: Image.asset(AppIcons.Bmw, height: 40),
    type: "+8",
  ),
];

class CustomCardBrand extends StatelessWidget {
  final BrandModel brandModel;

  const CustomCardBrand({super.key, required this.brandModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            brandModel.image,
            Text(
              brandModel.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              brandModel.type,
              style: const TextStyle(color: AppColors.viewAllColor),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brand.length,
        itemBuilder: (context, index) {
          return CustomCardBrand(brandModel: brand[index]);
        },
      ),
    );
  }
}
