import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/features/favourite/data/models/tour_item_model.dart';
import 'package:safarni/features/favourite/presentation/widgets/fav_item_widget.dart';

import '../../../../core/constants/app_styles.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key,});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final List<MapEntry<int, TourItemModel>> favouriteToursWithIndex = [];

    for (int i = 0; i < tours.length; i++) {
      if (tours[i].isFavourite == true) {
        favouriteToursWithIndex.add(MapEntry(i, tours[i]));
      }
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text('Favourite', style: AppStyles.addressesTextStyle),
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushNamed(AppRoutes.homeScreen);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.grey900,
            size: 24.sp,
          ),
        ),
      ),
      body: favouriteToursWithIndex.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 64.sp,
              color: AppColors.grey400,
            ),
            SizedBox(height: 16.h),
            Text(
              'No favourite tours yet',
              style: AppStyles.titleTourSearchStyle.copyWith(
                color: AppColors.grey400,
              ),
            ),
          ],
        ),
      )
          : ListView.builder(
        shrinkWrap: true,
        itemCount: favouriteToursWithIndex.length,
        itemBuilder: (context, index) {
         final int originalTourIndex = favouriteToursWithIndex[index].key;
          return FavItemWidget(
            tourIndex: originalTourIndex,
            //TODO : will try remove it
          );
        },
      ),
    );
  }
}
