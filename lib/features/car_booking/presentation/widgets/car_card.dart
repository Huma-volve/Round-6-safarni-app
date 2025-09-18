import 'package:flutter/material.dart';
import 'package:safarni/features/car_booking/presentation/widgets/colum_car_booking.dart';

class CarCard extends StatelessWidget {
  const CarCard({required this.carModel, super.key});
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
            child: ColumCar(carModel: carModel, isSelecyted: true),
          ),
          Positioned(top: -80, right: -15, child: carModel.image),
        ],
      ),
    );
  }
}

class CarSliverListView extends StatelessWidget {
  const CarSliverListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return CarCard(carModel: carinfo[index]);
      }, childCount: carinfo.length),
    );
  }
}
