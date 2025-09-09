import 'package:flutter/material.dart';

import 'package:safarni/features/car_booking/presentation/widgets/car_card.dart';
import 'package:safarni/features/car_booking/presentation/widgets/custom_card_brand.dart';
import 'package:safarni/features/car_booking/presentation/widgets/custom_image.dart';
import 'package:safarni/features/internal_tour/presentation/views/widgets/custom_search_widget.dart';

import '../../../../core/constants/app_styles.dart';

class CarBookingView extends StatelessWidget {
  const CarBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Padding(
          padding: const EdgeInsets.all(16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchTextField(
                    onChanged: (value) {
                      debugPrint("User searched: $value");
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverToBoxAdapter(child: CustomImage()),
              SliverToBoxAdapter(child: SizedBox(height: 24)),

              SliverToBoxAdapter(
                child: Text("Brands", style: AppStyles.titleTourSearchStyle),
              ),

              SliverToBoxAdapter(child: CustomListView()),
              SliverToBoxAdapter(child: SizedBox(height: 24)),

              SliverToBoxAdapter(
                child: Text(
                  "popular Cars",
                  style: AppStyles.titleTourSearchStyle,
                ),
              ),
              CustomListViewCar(),
            ],
          ),
        ),
      ),
    );
  }
}
