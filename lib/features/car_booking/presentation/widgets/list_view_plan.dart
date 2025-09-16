import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/car_booking/domain/entits/car_entity.dart';

class ListViewMonthlyPlan extends StatefulWidget {
  final Car brandModel;
  final List<Car> plans;

  const ListViewMonthlyPlan({
    super.key,
    required this.brandModel,
    required this.plans,
  });

  @override
  State<ListViewMonthlyPlan> createState() => _ListViewMonthlyPlanState();
}

class _ListViewMonthlyPlanState extends State<ListViewMonthlyPlan> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: widget.plans.length,
        itemBuilder: (context, index) {
          final bool isSelected = index == selectedIndex;
          final Color borderColor = isSelected
              ? AppColors.categoryTitleColor
              : Colors.grey;
          final Color priceColor = isSelected
              ? AppColors.categoryTitleColor
              : Colors.grey;
          final car = widget.plans[index];

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                width: 200.w,
                height: 88.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor, width: 1.5),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.iconBottomNavColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.punch_clock_rounded),
                          const SizedBox(height: 4),
                          Text(
                            car.dailyRate != null
                                ? "${car.dailyRate} \$"
                                : "${car.dailyRate * 30} \$",
                            style: AppStyles.poppins14px400WGray500.copyWith(
                              color: priceColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hourly Rent", style: AppStyles.townName),
                        Text(
                          "Best for long",
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
