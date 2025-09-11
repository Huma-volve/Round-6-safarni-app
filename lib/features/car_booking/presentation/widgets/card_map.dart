import 'package:flutter/material.dart';
import 'package:safarni/features/car_booking/presentation/widgets/coulum_car_map.dart';

class CarCardMap extends StatelessWidget {
  const CarCardMap({super.key, required this.carModel});
  final CarModel carModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: CoulumCarMap(carModel: carModel),
          ),
          Positioned(top: -80, right: -15, child: carModel.image),
        ],
      ),
    );
  }
}
