import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/car_booking/presentation/cubit/cubit/car_cubit.dart';
import 'package:safarni/features/car_booking/presentation/cubit/cubit/car_state.dart';
import 'package:safarni/features/car_booking/presentation/views/google_map_view.dart';
import 'package:safarni/features/car_booking/presentation/widgets/car_animation.dart';
import 'package:safarni/features/car_booking/presentation/widgets/container_info.dart';
import 'package:safarni/features/car_booking/presentation/widgets/list_view_plan.dart';
import 'package:safarni/features/car_booking/presentation/widgets/location_text_form_feild.dart';
import 'package:safarni/features/car_booking/presentation/widgets/material_buttom_widget.dart';

final List<Map<String, String>> cars = [
  {
    "power": "429 hp @ 6,100 rpm",
    "maxSpeed": "280 km/h",
    "acceleration": "4.9 sec (0-60 mph)",
  },
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

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key, required this.carId});
  final int carId;

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _mapController = Completer();
    LatLng? searchedLocation;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<CarCubit, CarState>(
        builder: (context, state) {
          if (state is CarLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CarError) {
            return Center(child: Text(state.message));
          } else if (state is CarLoadedOne) {
            final car = state.car;
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(child: CarAnimation()),

                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Popular Cars", style: AppStyles.townName),
                      ),
                    ),

                    SliverToBoxAdapter(child: ContainerListView(cars: cars)),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Plan", style: AppStyles.townName),
                      ),
                    ),

                    SliverToBoxAdapter(child: ListViewPlan(carPlan: car)),

                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Location",
                          style: AppStyles.tourTitleStyle,
                        ),
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: LocationTextFormField(
                        mapController: _mapController,
                        onLocationSelected: (latLng) {
                          searchedLocation = latLng;
                        },
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: MaterialButtonWidget(
                          text: "Pick Up",
                          onPressed: () {
                            if (searchedLocation != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => GoogleMapView(
                                    carModel: car,
                                    targetLocation: searchedLocation,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                Positioned(
                  top: 30,
                  left: 10,
                  child: FloatingActionButton(
                    onPressed: () => Navigator.pop(context),
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
