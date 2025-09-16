import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/di/get_it.dart';
import 'package:safarni/features/car_booking/domain/use_case/get_car.dart';
import 'package:safarni/features/car_booking/domain/use_case/get_car_by_id.dart';
import 'package:safarni/features/car_booking/presentation/cubit/cubit/car_cubit.dart';
import 'package:safarni/features/car_booking/presentation/cubit/cubit/car_state.dart';
import 'package:safarni/features/car_booking/presentation/widgets/car_animation.dart';
import 'package:safarni/features/car_booking/presentation/widgets/container_info.dart';
import 'package:safarni/features/car_booking/presentation/widgets/list_view_plan.dart';
import 'package:safarni/features/car_booking/presentation/widgets/location_text_form_feild.dart';
import 'package:safarni/features/car_booking/presentation/widgets/material_buttom_widget.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key, required this.carId});
  final int carId;

  @override
  Widget build(BuildContext context) {
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

                    SliverToBoxAdapter(child: ContainerListView(cars: [car])),

                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Plan", style: AppStyles.townName),
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: ListViewMonthlyPlan(brandModel: car, plans: [car]),
                    ),

                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Location",
                          style: AppStyles.tourTitleStyle,
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(child: LocationTextFormFeild()),

                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: MaterialButtonWidget(
                          text: "Pick Up",
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.MapScreen,
                              arguments: car,
                            );
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
