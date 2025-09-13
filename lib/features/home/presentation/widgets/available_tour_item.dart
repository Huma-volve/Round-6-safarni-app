import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/custom_rating.dart';
import 'package:safarni/core/widgets/spacing.dart';
import 'package:safarni/features/favourite/data/models/tour_item_model.dart';
import 'package:safarni/features/home/data/models/available_tour_model.dart';
import 'package:safarni/features/home/presentation/widgets/recommendation_item_model.dart';

class AvailableTourItem extends StatelessWidget {
 final AvailableTourModel availableTourModel;
  const AvailableTourItem({required this.availableTourModel, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.destantionRouteName);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 1, right: 8.0, bottom: 16),
        child: Container(
          height: 104.h,
          width: 343.w,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.sp),
            boxShadow: const [
              BoxShadow(
                color: AppColors.grey200,
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.sp),
                    child: Image(
                      image: NetworkImage(availableTourModel.image),
                      fit: BoxFit.cover,
                      width: 88.w,
                      height: 88.h,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Full Day Tour",
                          style: AppStyles.fullTourStyle,
                        ),
                        const HeightSpace(height: 12),
                        AutoSizeText(
                          getFirstWords(availableTourModel.title, 5),
                          style: AppStyles.tourTitleStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const HeightSpace(height: 12),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'From ',
                                  style: AppStyles.priceTourStyle.copyWith(
                                    color: AppColors.grey600,
                                  ),
                                ),
                                TextSpan(
                                  text: '${availableTourModel.price}\$ ',
                                  style: AppStyles.priceTourStyle,
                                ),
                                TextSpan(
                                  text: 'per person',
                                  style: AppStyles.priceTourStyle.copyWith(
                                    color: AppColors.grey600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const WidthSpace(width: 30),
                ],
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CustomRating(rating: availableTourModel.rating.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
