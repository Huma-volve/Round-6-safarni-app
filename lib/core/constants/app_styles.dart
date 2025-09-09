
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';

class AppStyles{

  static TextStyle addressesTextStyle=TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w500,
    fontFamily: "Poppins-Medium",
    color: AppColors.grey900
  );

  static TextStyle tourTitleStyle=TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins-Medium",
    color: AppColors.grey900
  );
  static TextStyle viewAllStyle=TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins-Medium",
    color: AppColors.viewAllColor
  );
  static TextStyle categoryTitleStyle=TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins-Medium"
  );
  static TextStyle bioStyle=TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins-Regular",
    color: AppColors.grey400
  );

  static TextStyle fullTourStyle=TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins-SemiBold",
    color: AppColors.grey500
  );
  static TextStyle bottomNavTitle=TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins-Regular",
      color: AppColors.grey600
  );
  static TextStyle searchText=TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins-Regular",
      color: AppColors.grey400
  );

  static TextStyle priceTourStyle=TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      fontFamily: "Poppins-Bold",
      color: AppColors.priceColor
  );

}
