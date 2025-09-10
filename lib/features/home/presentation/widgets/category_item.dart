import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String title;
  const CategoryItem({required this.title, required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          CircleAvatar(radius: 38.sp, backgroundImage: AssetImage(image)),
          Text(title, style: AppStyles.categoryTitleStyle),
        ],
      ),
    );
  }
}
