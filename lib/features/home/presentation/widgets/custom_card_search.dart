import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/custom_rating.dart';
import 'package:safarni/core/widgets/spacing.dart';

class CustomCardSearch extends StatefulWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final int reviews;
  final String pickup;
  final String days;
  final String price;
  final int delay;

  const CustomCardSearch({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.reviews,
    required this.pickup,
    required this.days,
    required this.price,
    this.delay = 0,
  });

  @override
  State<CustomCardSearch> createState() => _TourCardState();
}

class _TourCardState extends State<CustomCardSearch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _offset;
  bool isFavourite=false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _offset = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
        .animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

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
            boxShadow: [
              BoxShadow(
                color: AppColors.grey200,
                blurRadius: 4,
                spreadRadius: 1,
                offset: Offset(5,5)
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.h,right: 16.w,left: 16.w),
                    child: ClipRRect(
                      borderRadius:
                       BorderRadius.circular(8.r),
                      child: Image.network(
                        widget.imageUrl,
                        height: 223.h,
                        width: 311.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 24.h,
                    right: 24.w,
                    child: Container(
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white
                      ),
                      child: IconButton(
                        icon:  Icon(isFavourite==true?CupertinoIcons.heart_fill:CupertinoIcons.heart,
                            color:isFavourite==true?AppColors.red:AppColors.grey900 ),
                        onPressed: () {
                          setState(() {
                            if(isFavourite==false){
                              isFavourite=true;
                            }
                            else{
                              isFavourite=false;
                            }

                          });
                        },
                      ),
                    ),
                  )
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
                            widget.title,
                            style: AppStyles.titleTourSearchStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                           CustomRating(rating: "${widget.rating} "),
                            Text(
                              "(${widget.reviews})",
                              style: AppStyles.reviewTourSearchStyle,),
                          ],
                        )
                      ],
                    ),
                    HeightSpace(height: 8),
                    Row(
                      children: [
                        Text(widget.pickup,
                            style: AppStyles.searchText),
                        WidthSpace(width: 16),
                         Icon(Icons.circle,
                            size: 12, color: AppColors.viewAllColor),
                        WidthSpace(width: 8),
                        Text(widget.days, style: AppStyles.searchText),
                      ],
                    ),
                    HeightSpace(height: 8),
                    Row(
                      children: [
                        Text("From ",
                            style: AppStyles.priceSearchTourStyle),
                        Text(
                          widget.price,
                          style: AppStyles.priceTourStyle
                        ),
                        Text(" per Person",
                            style: AppStyles.priceSearchTourStyle),
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
