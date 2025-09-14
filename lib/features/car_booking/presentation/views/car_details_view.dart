import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/car_booking/presentation/widgets/car_animation.dart';
import 'package:safarni/features/car_booking/presentation/widgets/container_info.dart';
import 'package:safarni/features/car_booking/presentation/widgets/list_view_plan.dart';
import 'package:safarni/features/car_booking/presentation/widgets/location_text_form_feild.dart';
import 'package:safarni/features/car_booking/presentation/widgets/material_buttom_widget.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: CarAnimation()),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Popular Cars", style: AppStyles.townName),
                ),
              ),
              SliverToBoxAdapter(child: ContainerListView()),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Plan", style: AppStyles.townName),
                ),
              ),
              SliverToBoxAdapter(child: ListViewPlan()),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Location", style: AppStyles.tourTitleStyle),
                ),
              ),
              SliverToBoxAdapter(child: LocationTextFormFeild()),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: MaterialButtonWidget(
                    text: "Pick Up",
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.MapScreen);
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
              onPressed: () {},
              child: SvgPicture.asset(
                "assets/icons/chevron-left.svg",
                width: 24,
                height: 24,
              ),
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
