import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/spacing.dart';
import 'package:safarni/features/home/presentation/widgets/custom_card_search.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../favourite/data/models/tour_item_model.dart';

class ResultOfSearchScreen extends StatefulWidget {
  final String? title;
  const ResultOfSearchScreen({super.key, this.title});

  @override
  State<ResultOfSearchScreen> createState() => _ResultOfSearchScreenState();
}

class _ResultOfSearchScreenState extends State<ResultOfSearchScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.grey900,
            size: 24.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
            CupertinoIcons.search,
            color: AppColors.grey900,
            size: 24.sp,
          ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.filterScreen,arguments: widget.title);
            },
            icon: Icon(
            Icons.edit_note_outlined,
            color: AppColors.grey900,
            size: 24.sp,
          ),
          ),
        ],
      ),
      body: Column(
        children: [
          HeightSpace(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(widget.title??"",style: AppStyles.townName,),
                WidthSpace(width: 7),
                Text(" ${tours.length} Results", style: AppStyles.bottomNavTitle.copyWith(fontSize: 15.sp),)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: tours.length,
              itemBuilder: (context, index) {
             //   final tour = tours[index];
                return CustomCardSearch(
                 tourIndex: index,
                  delay: index * 100,
                );

              },
            ),
          ),
        ],
      ),
    );
  }
}
