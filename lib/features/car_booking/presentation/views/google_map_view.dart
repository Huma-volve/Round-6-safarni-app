import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/features/car_booking/domain/entits/car_entity.dart';
import 'package:safarni/features/car_booking/presentation/widgets/card_map.dart';
import 'package:safarni/features/car_booking/presentation/widgets/map_google_widget.dart';

class GoogleMapView extends StatelessWidget {
  final Car carModel;
  final LatLng? targetLocation;

  const GoogleMapView({super.key, required this.carModel, this.targetLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SizedBox.expand(child: MapSample(initialLocation: targetLocation)),
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
