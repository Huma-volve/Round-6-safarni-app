import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';

class AppStyles {
  static TextStyle poppins24px700WPrimayColor = TextStyle(
    fontFamily: FontFamilyNames.poppins,
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.primary,
  );
  static TextStyle poppins16px600WPrimayColor = TextStyle(
    fontFamily: FontFamilyNames.poppins,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static TextStyle poppins24px600WGray800 = TextStyle(
    fontFamily: FontFamilyNames.poppins,
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.gray800,
  );
  static TextStyle poppins14px600WGray600 = TextStyle(
    fontFamily: FontFamilyNames.poppins,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.gray600,
  );
  static TextStyle poppins16px600WGray700 = TextStyle(
    fontFamily: FontFamilyNames.poppins,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.gray700,
  );

  static TextStyle poppins32px600WGray900 = TextStyle(
    fontFamily: FontFamilyNames.poppins,
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.gray900,
  );
  static TextStyle poppins14px400WGray500 = TextStyle(
    fontFamily: FontFamilyNames.poppins,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grayy500,
  );
  static TextStyle poppins14px500WGray800 = TextStyle(
    fontFamily: FontFamilyNames.poppins,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.gray800,
  );
  static TextStyle addressesTextStyle = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins-Medium',
    color: AppColors.grey900,
  );

  static TextStyle tourTitleStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins-Medium',
    color: AppColors.grey900,
  );
  static TextStyle viewAllStyle = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins-Medium',
    color: AppColors.viewAllColor,
  );
  static TextStyle categoryTitleStyle = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins-Medium',
  );
  static TextStyle bioStyle = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins-Regular',
    color: AppColors.grey400,
  );

  static TextStyle fullTourStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins-SemiBold',
    color: AppColors.grey500,
  );
  static TextStyle rateStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins-SemiBold',
    color: AppColors.grey500,
  );
  static TextStyle bottomNavTitle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins-Regular',
    color: AppColors.grey600,
  );
  static TextStyle searchText = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins-Regular',
    color: AppColors.grey400,
  );

  static TextStyle priceTourStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins-Bold',
    color: AppColors.priceColor,
  );
  static TextStyle searchTitleStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins-Medium',
    color: AppColors.grey900,
  );
  static TextStyle subTitleSearchStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins-Regular',
    color: AppColors.grey500,
  );
  static TextStyle titleTourSearchStyle = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins-SemiBold',
    color: AppColors.grey900,
  );
  static TextStyle reviewTourSearchStyle = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins-SemiBold',
    color: AppColors.grey500,
  );
  static TextStyle priceSearchTourStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins-Regular',
    color: AppColors.grey600,
  );
  static TextStyle townName = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins-SemiBold',
    color: AppColors.black,
  );
  static TextStyle textRegular15({required BuildContext context}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textMedium15({required BuildContext context}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textMedium17({required BuildContext context}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 17),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textMedium12({required BuildContext context}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textSemiBold12({required BuildContext context}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      height: 1,
      letterSpacing: 0.24,
    );
  }

  static TextStyle textMedium16({required BuildContext context}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textRegular14({required BuildContext context}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      height: 1.57,
      letterSpacing: -0.18,
    );
  }

  static TextStyle textMedium13({required BuildContext context}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textSemiBold13({required BuildContext context}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      height: 1.54,
    );
  }

  static TextStyle textSemiBold14({required BuildContext context}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      height: 0.86,
      letterSpacing: 0.28,
    );
  }

  static TextStyle textRegular13({required BuildContext context}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      height: 1.23,
    );
  }

  static TextStyle textRegular16({required BuildContext context}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textSemiBold16({required BuildContext context}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      height: 1,
      letterSpacing: 0.32,
    );
  }

  static TextStyle textSemiBold15({required BuildContext context}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textRegular17({required BuildContext context}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 17),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      height: 1.36,
    );
  }

  static TextStyle textMedium20({required BuildContext context}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      height: 0.80,
    );
  }

  static TextStyle textSemiBold17({required BuildContext context}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 17),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textMedium18({required BuildContext context}) {
    return TextStyle(
      color: const Color(0xFF2B2B2B),
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle containerFilterStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins-Regular',
    color: AppColors.grey500,
    // height: 16.h
  );

  static TextStyle font18Bold = TextStyle(
    fontSize: 14.sp,

    fontWeight: FontWeight.w700,

    fontFamily: 'Poppins-Bold',

    color: AppColors.blue700Color,
  );

  static TextStyle font12SemiBold = TextStyle(
    fontSize: 12.sp,

    fontWeight: FontWeight.w600,

    fontFamily: 'Poppins-SemiBold',

    color: AppColors.grey600,
  );

  static TextStyle font14Meduim = TextStyle(
    fontSize: 14.sp,

    fontWeight: FontWeight.w500,

    fontFamily: 'Poppins-Medium',

    color: AppColors.grey600,
  );

  static TextStyle font15Regular = TextStyle(
    fontSize: 15.sp,

    fontWeight: FontWeight.w400,

    fontFamily: 'Poppins-Regular',

    color: AppColors.grey900,
  );
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  final double scaleFactor = getScaleFactor(context);
  final double responsiveSize = scaleFactor * fontSize;

  final double lowerFont = fontSize * .8;
  final double upperFont = fontSize * 1;
  return responsiveSize.clamp(lowerFont, upperFont);
}

double getScaleFactor(context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < 1300) {
    return width / 1100;
  } else {
    return width / 1300;
  }
}

class FontFamilyNames {
  static String poppins = 'Poppins';
}
