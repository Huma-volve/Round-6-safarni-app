import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class SearchItem extends StatelessWidget {
 final String title;
 final String description;
  const SearchItem({required this.title, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(width:50.w,height: 50.h,decoration: BoxDecoration(color: AppColors.grey200,borderRadius: BorderRadius.circular(10)),child: const Icon(Icons.location_on_outlined,size: 30,color: AppColors.priceColor,)),
        title: Text(title,style: AppStyles.searchTitleStyle,),
        subtitle: Text(description,style: AppStyles.subTitleSearchStyle,),

      ),
    );
  }
}
