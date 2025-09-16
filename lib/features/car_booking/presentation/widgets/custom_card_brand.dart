import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_images.dart';

import 'package:safarni/features/car_booking/domain/entits/car_entity.dart';

class CustomCardBrand extends StatelessWidget {
  final Car brandModel;

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
            Image.asset(AppImages.mercedes, width: 45, height: 50),
            Text(
              brandModel.brand,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "+${brandModel.seats}",
              style: const TextStyle(color: AppColors.viewAllColor),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.cars});
  final List<Car> cars;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CustomCardBrand(brandModel: cars[index]);
        },
      ),
    );
  }
}
