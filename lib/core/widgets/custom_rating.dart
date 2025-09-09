import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class CustomRating extends StatelessWidget {
  String rating;
   CustomRating({super.key,required this.rating});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(Icons.star_rounded, color: AppColors.yellowColor, size: 18.sp,),
        Text(rating, style: AppStyles.rateStyle),
      ],
    );
  }
}
