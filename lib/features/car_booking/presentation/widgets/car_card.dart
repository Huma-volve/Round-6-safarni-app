import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/features/car_booking/domain/entits/car_entity.dart';
import 'package:safarni/features/car_booking/presentation/widgets/colum_car_booking.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key, required this.car});
  final Car car;

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
            child: ColumCar(carModel: car, isSelecyted: true),
          ),
          Positioned(
            top: -80,
            right: -15,
            child: Image.asset(AppImages.type_car_2),
          ),
        ],
      ),
    );
  }
}

class CarSliverListView extends StatelessWidget {
  const CarSliverListView({super.key, required this.cars});
  final List<Car> cars;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return CarCard(car: cars[index]);
      }, childCount: cars.length),
    );
  }
}
