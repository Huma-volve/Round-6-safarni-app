import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/features/favourite/data/models/tour_item_model.dart';
import 'package:safarni/features/favourite/presentation/widgets/fav_item_widget.dart';

import '../../../../core/constants/app_styles.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {


  @override
  Widget build(BuildContext context) {
    final favouriteTours=tours.where((tour)=>tour.isFavourite==true).toList();

        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            centerTitle: true,
            title: Text('Favourite', style: AppStyles.addressesTextStyle),
            leading: IconButton(
              onPressed: () {
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.grey900,
                size: 24.sp,
              ),
            ),
          ),
          body: ListView.builder(
          shrinkWrap: true,
          itemCount: favouriteTours.length,
          itemBuilder: (context,index){
            return FavItemWidget(tourIndex: index);
          },
        ),



    );
  }
}
