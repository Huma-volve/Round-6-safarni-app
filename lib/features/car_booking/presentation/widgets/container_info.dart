import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_styles.dart';

class ContainerListView extends StatelessWidget {
  const ContainerListView({super.key});

  final List<Map<String, String>> cars = const [
    {"name": "Pawer", "power": "650 hp @ 8,000 rpm"},
    {"name": "Max Spead", "maxSpeed": "320 km/h"},

    {"name": "Acceleration", "acceleration": "4.9 sec 0-60 mph"},
  ];

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
              child: ContainerInfo(
                power: car["power"],
                maxSpeed: car["maxSpeed"],
                acceleration: car["acceleration"],
                name: car["name"],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ContainerInfo extends StatelessWidget {
  const ContainerInfo({
    super.key,
    this.name,
    this.power,
    this.maxSpeed,
    this.acceleration,
  });

  final String? name;
  final String? power;
  final String? maxSpeed;
  final String? acceleration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (name != null) Text(name!, style: AppStyles.tourTitleStyle),
          if (power != null)
            Text(
              power!,
              style: AppStyles.priceSearchTourStyle.copyWith(
                color: Colors.grey,
              ),
            ),
          if (maxSpeed != null)
            Text(
              maxSpeed!,
              style: AppStyles.priceSearchTourStyle.copyWith(
                color: Colors.grey,
              ),
            ),
          if (acceleration != null)
            Text(
              acceleration!,
              style: AppStyles.priceSearchTourStyle.copyWith(
                color: Colors.grey,
              ),
            ),
        ],
      ),
    );
  }
}
