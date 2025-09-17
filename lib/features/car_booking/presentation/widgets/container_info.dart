import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_styles.dart';

final List<Map<String, String>> cars = [
  {
    "power": "429 hp @ 6,100 rpm",
    "maxSpeed": "280 km/h",
    "acceleration": "4.9 sec (0-60 mph)",
  },
  {
    "power": "503 hp @ 6,250 rpm",
    "maxSpeed": "290 km/h",
    "acceleration": "3.8 sec (0-60 mph)",
  },
  {
    "power": "503 hp @ 6,250 rpm",
    "maxSpeed": "290 km/h",
    "acceleration": "3.8 sec (0-60 mph)",
  },
];

class ContainerListView extends StatelessWidget {
  final List<Map<String, String>> cars;

  ContainerListView({super.key, required this.cars});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cars.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final car = cars[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
              width: 160.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey, width: 0.5),
              ),
              child: ContainerInfo(carpower: car, text: "power"),
            ),
          );
        },
      ),
    );
  }
}

class ContainerInfo extends StatelessWidget {
  final Map<String, String> carpower;
  final String text;

  const ContainerInfo({super.key, required this.carpower, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: AppStyles.priceSearchTourStyle.copyWith(color: Colors.black),
          ),
          Text(
            carpower[text] ?? "-",
            style: AppStyles.priceSearchTourStyle.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
