import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/features/favourite/data/models/tour_item_model.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/spacing.dart';

class FavItemWidget extends StatefulWidget {
  final int tourIndex;
  //TODO : try adding a onFavChange function

  const FavItemWidget({required this.tourIndex, super.key});

  @override
  State<FavItemWidget> createState() => _FavItemWidgetState();
}

class _FavItemWidgetState extends State<FavItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8.0, right: 8.0, bottom: 16),
      child: Container(
        height: 104.h,
        width: MediaQuery.of(context).size.width * .97,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.sp),
          boxShadow: const [
            BoxShadow(color: AppColors.grey200, blurRadius: 2, spreadRadius: 1),
          ],
        ),
        child: Stack(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.sp),
                  child: Image(
                    image: NetworkImage(tours[widget.tourIndex].image),
                    fit: BoxFit.cover,
                    width: 88.w,
                    height: 88.h,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tours[widget.tourIndex].time!,
                        style: AppStyles.fullTourStyle,
                      ),
                      const HeightSpace(height: 12),
                      Text(
                        tours[widget.tourIndex].title,
                        style: AppStyles.tourTitleStyle,
                      ),
                      const HeightSpace(height: 12),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'From ',
                              style: AppStyles.priceTourStyle.copyWith(
                                color: AppColors.grey600,
                              ),
                            ),
                            TextSpan(
                              text: '${tours[widget.tourIndex].price} ',
                              style: AppStyles.priceTourStyle,
                            ),
                            TextSpan(
                              text: 'per person',
                              style: AppStyles.priceTourStyle.copyWith(
                                color: AppColors.grey600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8.h,
              right: 8.h,
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.heart_fill,
                  color: AppColors.red,
                ),
                onPressed: () {
                  setState(() {
                    tours[widget.tourIndex] = tours[widget.tourIndex].copyWith(
                      isFavourite: false,
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
