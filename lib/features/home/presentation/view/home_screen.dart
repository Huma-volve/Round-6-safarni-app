import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/widgets/custom_text_field.dart';
import 'package:safarni/core/widgets/spacing.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome', style: AppStyles.addressesTextStyle),
              Text(
                'Explore The Best Places In World! ',
                style: AppStyles.bioStyle,
              ),
            ],
          ),
          actions: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  radius: 24.r,
                  backgroundImage: AssetImage(AppAssets.myPhoto),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const HeightSpace(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextField(controller: _controller),
                  Container(
                    width: 40.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      border: Border.all(color: AppColors.grey200),
                    ),
                    child: Icon(
                      Icons.edit_note,
                      size: 30.sp,
                      color: AppColors.grey400,
                    ),
                  ),
                ],
              ),
              const HeightSpace(height: 32),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.sp),
                child: Image.asset(
                  AppAssets.homeMainPhoto,
                  fit: BoxFit.cover,
                  width: 343.w,
                  height: 211.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
