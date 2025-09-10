import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CustomRoundedContainer extends StatelessWidget {
  final String text;
  final bool isSelected;
  const CustomRoundedContainer({required this.text, required this.isSelected,super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(8),
     height: 40.h,
      decoration: BoxDecoration(
        border: Border.all(color: (isSelected==true)?AppColors.containerRounded:AppColors.grey200),
        color:(isSelected==true)?AppColors.containerRounded:AppColors.white ,
        borderRadius: BorderRadius.circular(38.r)
      ),
      child: Text(text,style: AppStyles.containerFilterStyle.copyWith(
        color: isSelected==true?AppColors.priceColor:AppColors.grey500
      ),),
    );
  }
}
