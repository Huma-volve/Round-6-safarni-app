import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/features/car_booking/presentation/widgets/card_map.dart';
import 'package:safarni/features/car_booking/presentation/widgets/coulum_car_map.dart';
import 'package:safarni/features/car_booking/presentation/widgets/map_google_widget.dart';

class GoogleMapView extends StatelessWidget {
  GoogleMapView({super.key});
  final carModel = carinfoMap[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          const SizedBox.expand(child: MapSample()),

          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: CarCardMap(carModel: carModel),
          ),
        ],
      ),
    );
  }
}
