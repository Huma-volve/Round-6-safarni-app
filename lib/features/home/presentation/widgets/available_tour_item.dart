import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/custom_rating.dart';
import 'package:safarni/core/widgets/spacing.dart';
import 'package:safarni/features/favourite/data/models/tour_item_model.dart';

class AvailableTourItem extends StatelessWidget {
TourItemModel tourItemModel;
   AvailableTourItem({
    super.key,
 required this.tourItemModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:1,right: 8.0,bottom: 16),
      child: Container(
        height: 104.h,
        width: 343.w,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.sp),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey200,
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(0,0),
          )],
      ),
        child: Stack(
          children: [
            Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.sp),
                child: Image(image: AssetImage(tourItemModel.image),fit: BoxFit.cover,width:88.w ,height: 88.h,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tourItemModel.time!,style: AppStyles.fullTourStyle,),
                    HeightSpace(height: 12),
                    Text(tourItemModel.title,style: AppStyles.tourTitleStyle,),
                    HeightSpace(height: 12),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "From ",
                            style: AppStyles.priceTourStyle.copyWith(
                              color: AppColors.grey600,
                            ),
                          ),
                          TextSpan(
                            text: "${tourItemModel.price}\$ ",
                            style: AppStyles.priceTourStyle,
                          ),
                          TextSpan(
                            text: "per person",
                            style: AppStyles.priceTourStyle.copyWith(
                              color: AppColors.grey600,
                            ),
                          ),
                        ],),),],
                ),
              ),
              WidthSpace(width: 50),
            ],
          ),
            Positioned(
              top: 8,
              right: 8,
              child: CustomRating(rating: tourItemModel.review.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
