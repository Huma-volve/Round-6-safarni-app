import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:safarni/features/car_booking/domain/entits/car_entity.dart';
import 'package:safarni/features/car_booking/presentation/widgets/custom_togle_buttom.dart';

import '../../../../core/constants/app_routes.dart';

class ColumCar extends StatefulWidget {
  const ColumCar({
    super.key,
    required this.carModel,

    required this.isSelecyted,
  });
  final Car carModel;
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
          widget.carModel.brand,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),
        Row(
          spacing: 25,
          children: [
            Text(widget.carModel.transmission),

            Text("|"),

            Text("${widget.carModel.seats} seats"),

            Text("|"),

            Text(widget.carModel.fuelType),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            CustomToggleButton(
              text: "Detail",
              isSelected: selected == "Detail",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.carDetailsScreen,
                  arguments: widget.carModel.id,
                );
              },
            ),

            const SizedBox(width: 12),
            CustomToggleButton(
              text: "Rent now",
              isSelected: selected == "Rent now",
              onTap: () {
                setState(() {});
                Navigator.pushNamed(context, AppRoutes.MapScreen);
              },
            ),
          ],
        ),
      ],
    );
  }
}
