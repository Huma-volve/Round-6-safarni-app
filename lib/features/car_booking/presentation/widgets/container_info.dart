import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/car_booking/domain/entits/car_entity.dart';

class ContainerListView extends StatelessWidget {
  const ContainerListView({super.key, required this.cars});

  final List<Car> cars;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cars.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final car = cars[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
              width: 160,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey, width: 0.5),
              ),
              child: ContainerInfo(carpower: car),
            ),
          );
        },
      ),
    );
  }
}

class ContainerInfo extends StatelessWidget {
  const ContainerInfo({super.key, required this.carpower});
  final Car carpower;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Power",
            style: AppStyles.priceSearchTourStyle.copyWith(color: Colors.black),
          ),
          Text(
            carpower.brand,
            style: AppStyles.priceSearchTourStyle.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
