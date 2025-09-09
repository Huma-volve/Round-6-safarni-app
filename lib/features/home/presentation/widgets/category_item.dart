import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String title;
  const CategoryItem({super.key,required this.title,required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 38.sp,
            backgroundImage: AssetImage(image),
          ),
          Text(title,style: AppStyles.categoryTitleStyle,)
        ],
      ),
    );
  }
}
