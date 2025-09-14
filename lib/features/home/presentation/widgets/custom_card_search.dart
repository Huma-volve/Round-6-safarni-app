import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/custom_rating.dart';
import 'package:safarni/core/widgets/spacing.dart';
import 'package:safarni/features/favourite/data/models/tour_item_model.dart';

class CustomCardSearch extends StatefulWidget {
  final int delay;
  final int tourIndex;
  final VoidCallback? onFavoriteChanged; // Add callback for state changes

  const CustomCardSearch({
    required this.tourIndex,
    super.key,
    this.delay = 0,
    this.onFavoriteChanged,
  });

  @override
  State<CustomCardSearch> createState() => _TourCardState();
}

class _TourCardState extends State<CustomCardSearch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _offset;
  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _offset = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _offset,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.sp),
            boxShadow: const [
              BoxShadow(
                color: AppColors.grey200,
                blurRadius: 4,
                spreadRadius: 1,
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 16.h,
                      right: 16.w,
                      left: 16.w,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.network(
                        tours[widget.tourIndex].image,
                        height: 223.h,
                        width: MediaQuery.of(context).size.width * .85,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 24.h,
                    right: 24.w,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            tours[widget.tourIndex] = tours[widget.tourIndex]
                                .copyWith(
                                  isFavourite:
                                      !(tours[widget.tourIndex].isFavourite),
                                );
                          });
                          if (widget.onFavoriteChanged != null) {
                            widget.onFavoriteChanged!();
                          }
                        },
                        icon: Icon(
                          tours[widget.tourIndex].isFavourite == true
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          color: tours[widget.tourIndex].isFavourite == true
                              ? AppColors.red
                              : AppColors.grey900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            tours[widget.tourIndex].title,
                            style: AppStyles.titleTourSearchStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            CustomRating(
                              rating: '${tours[widget.tourIndex].rating} ',
                            ),
                            Text(
                              '(${tours[widget.tourIndex].review})',
                              style: AppStyles.reviewTourSearchStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const HeightSpace(height: 8),
                    Row(
                      children: [
                        Text(
                          tours[widget.tourIndex].pickup!,
                          style: AppStyles.searchText,
                        ),
                        const WidthSpace(width: 16),
                        const Icon(
                          Icons.circle,
                          size: 12,
                          color: AppColors.viewAllColor,
                        ),
                        const WidthSpace(width: 8),
                        Text(
                          tours[widget.tourIndex].days!,
                          style: AppStyles.searchText,
                        ),
                      ],
                    ),
                    const HeightSpace(height: 8),
                    Row(
                      children: [
                        Text('From ', style: AppStyles.priceSearchTourStyle),
                        Text(
                          tours[widget.tourIndex].price,
                          style: AppStyles.priceTourStyle,
                        ),
                        Text(
                          ' per Person',
                          style: AppStyles.priceSearchTourStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
