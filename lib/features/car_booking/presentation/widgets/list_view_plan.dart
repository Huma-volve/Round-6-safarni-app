import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class ListViewPlan extends StatefulWidget {
  const ListViewPlan({super.key});

  @override
  State<ListViewPlan> createState() => _ListViewPlanState();
}

class _ListViewPlanState extends State<ListViewPlan> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> plans = [
      {
        "type": "Hourly Rent",
        "description": "Best for business",
        "price": "/\$10",
        "image": "assets/icons/clock.svg",
      },
      {
        "type": "Daily Rent",
        "description": "Best for trips",
        "price": "/\$50",
        "image": "assets/icons/Vector.svg",
      },
    ];

    return SizedBox(
      height: 80,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: plans.length,
        itemBuilder: (context, index) {
          final plan = plans[index];
          final bool isSelected = index == selectedIndex;

          final String image = plan["image"]!;
          final String price = plan["price"]!;
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
                        color: AppColors.containerColor,
                        borderRadius: BorderRadius.circular(8),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(image),
                          const SizedBox(height: 4),
                          Text(
                            price,
                            style: AppStyles.titleTourSearchStyle.copyWith(
                              color: priceColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(plan["type"]!, style: AppStyles.townName),
                        Text(
                          plan["description"]!,
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
