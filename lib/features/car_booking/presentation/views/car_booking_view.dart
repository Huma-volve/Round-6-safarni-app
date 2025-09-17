import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/car_booking/presentation/cubit/cubit/car_cubit.dart';
import 'package:safarni/features/car_booking/presentation/cubit/cubit/car_state.dart';
import 'package:safarni/features/car_booking/presentation/widgets/custom_card_brand.dart';
import 'package:safarni/features/car_booking/presentation/widgets/custom_image.dart';
import 'package:safarni/features/car_booking/presentation/widgets/car_card.dart';
import 'package:safarni/features/internal_tour/presentation/views/widgets/custom_search_widget.dart';

class CarBookingView extends StatelessWidget {
  const CarBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<CarCubit, CarState>(
          builder: (context, state) {
            if (state is CarLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CarLoaded) {
              final cars = state.cars;

              return Padding(
                padding: const EdgeInsets.all(16),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 6,
                        ),
                        child: SearchTextField(
                          onSearch: (query) {
                            context.read<CarCubit>().fetchCars(
                              searchQuery: query,
                            );
                          },
                        ),
                      ),
                    ),
                    //const SliverToBoxAdapter(child: SizedBox(height: 24)),
                    const SliverToBoxAdapter(child: CustomImage()),
                    const SliverToBoxAdapter(child: SizedBox(height: 24)),

                    SliverToBoxAdapter(
                      child: Text(
                        "Brands",
                        style: AppStyles.titleTourSearchStyle,
                      ),
                    ),

                    SliverToBoxAdapter(child: CustomListView(cars: cars)),

                    const SliverToBoxAdapter(child: SizedBox(height: 24)),

                    SliverToBoxAdapter(
                      child: Text(
                        "Popular Cars",
                        style: AppStyles.titleTourSearchStyle,
                      ),
                    ),

                    CarSliverListView(cars: cars),
                  ],
                ),
              );
            } else if (state is CarError) {
              return Center(child: Text(state.message));
            } else {
              context.read<CarCubit>().fetchCars();
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
