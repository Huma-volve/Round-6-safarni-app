import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/features/car_booking/presentation/widgets/custom_togle_buttom.dart';

import '../../../../core/constants/app_routes.dart';

class CarModel {
  final String name;
  final Widget image;
  final String automatic;
  final String seats;
  final String type;

  CarModel({
    required this.automatic,
    required this.seats,
    required this.name,
    required this.image,
    required this.type,
  });
}

List<CarModel> carinfo = [
  CarModel(
    name: "S 500 Sedan",
    image: Image.asset(AppImages.type_car_2, height: 165, width: 200),
    type: "patroal",
    automatic: "Automatic",
    seats: "seats",
  ),
  CarModel(
    name: "S 500 Sedan",
    image: Image.asset(AppImages.type_car_1, height: 165, width: 230),
    type: "patroal",
    automatic: "Automatic",
    seats: "seats",
  ),
  CarModel(
    name: "S 500 Sedan",
    image: Image.asset(AppImages.type_car_1, height: 165, width: 230),
    type: "patroal",
    automatic: "Automatic",
    seats: "seats",
  ),
  CarModel(
    name: "S 500 Sedan",
    image: Image.asset(AppImages.type_car_3, height: 165, width: 200),
    type: "patroal",
    automatic: "Automatic",
    seats: "seats",
  ),
];

class ColumCar extends StatefulWidget {
  const ColumCar({
    super.key,
    required this.carModel,

    required this.isSelecyted,
  });
  final CarModel carModel;
  final bool isSelecyted;

  @override
  State<ColumCar> createState() => _ColumCarState();
}

class _ColumCarState extends State<ColumCar> {
  String selected = "Rent Now";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.carModel.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),
        Row(
          spacing: 25,
          children: [
            Text(widget.carModel.automatic),

            Text("|"),

            Text(widget.carModel.seats),

            Text("|"),

            Text(widget.carModel.type),
            SizedBox(width: 8),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            CustomToggleButton(
              text: "Rent Now",
              isSelected: selected == "Rent Now",
              onTap: () {
                setState(() {
                  selected = "Rent Now";
                });
                Navigator.pushNamed(context, AppRoutes.MapScreen);
              },
            ),

            const SizedBox(width: 12),
            CustomToggleButton(
              text: "Detail",
              isSelected: selected == "Detail",
              onTap: () {
                setState(() {
                  selected = "Detail";
                });
                Navigator.pushNamed(context, AppRoutes.carDetailsScreen);
              },
            ),
          ],
        ),
      ],
    );
  }
}
