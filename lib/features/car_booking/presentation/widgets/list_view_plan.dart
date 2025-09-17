import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/car_booking/domain/entits/car_entity.dart';

class ListViewPlan extends StatefulWidget {
  const ListViewPlan({super.key, required this.carPlan});
  final Car carPlan;
  @override
  State<ListViewPlan> createState() => _ListViewPlanState();
}

class _ListViewPlanState extends State<ListViewPlan> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          final bool isSelected = index == selectedIndex;

          final Color borderColor = isSelected
              ? AppColors.categoryTitleColor
              : Colors.grey;
          final Color priceColor = isSelected
              ? AppColors.categoryTitleColor
              : Colors.grey;

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                width: 180,
                height: 77,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor, width: 1.5),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.bordergreyColor,
                        borderRadius: BorderRadius.circular(8),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/Vector.svg"),
                          const SizedBox(height: 4),
                          Text(
                            "${widget.carPlan.dailyRate}",
                            style: AppStyles.titleTourSearchStyle.copyWith(
                              color: priceColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 7),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hourly Rent", style: AppStyles.townName),
                        Text(
                          "Best for business",
                          style: AppStyles.priceSearchTourStyle.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
