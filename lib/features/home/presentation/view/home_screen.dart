import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/widgets/custom_text_field.dart';
import 'package:safarni/core/widgets/spacing.dart';
import 'package:safarni/features/home/presentation/widgets/available_tour_item.dart';
import 'package:safarni/features/home/presentation/widgets/category_item.dart';
import 'package:safarni/features/home/presentation/widgets/recommendation_item_model.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../favourite/data/models/tour_item_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> categoriesList = [
    {'photo': AppImages.homeFlightPhoto, 'title': 'Flight'},
    {'photo': AppImages.homeCarPhoto, 'title': 'Car'},
    {'photo': AppImages.homeTourPhoto, 'title': 'Tour'},
    {'photo': AppImages.homeHotelPhoto, 'title': 'Hotel'},
  ];
  List<Map<String, dynamic>> recommendationList = [
    {
      'photo': AppImages.homePyramidPhoto,
      'title': 'The Pyramids',
      'rating': '4.8',
      'location': 'Giza',
    },
    {
      'photo': AppImages.homeCitadelPhoto,
      'title': 'The Citadel  ',
      'rating': '4.1',
      'location': 'Cairo',
    },
    {
      'photo': AppImages.dahabPhoto,
      'title': 'Dahab',
      'rating': '4.9',
      'location': 'Dahab',
    },
    {
      'photo': AppImages.fayoumPhoto,
      'title': 'Fayoum',
      'rating': '4.2',
      'location': 'Fayoum',
    },
  ];


  Widget buildCategory(context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth / categoriesList.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Categories", style: AppStyles.addressesTextStyle),
        const HeightSpace(height: 15),
        SizedBox(
          height: 95.h,
          width: screenWidth,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoriesList.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: itemWidth,
                child: CategoryItem(
                  title: categoriesList[index]["title"],
                  image: categoriesList[index]["photo"],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildRecommendationWidget() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recommendation', style: AppStyles.addressesTextStyle),
              InkWell(child: Text('ViewAll', style: AppStyles.viewAllStyle)),
            ],
          ),
        ),
        const HeightSpace(height: 8),
        SizedBox(
          height: 301,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recommendationList.length,
            itemBuilder: (context, index) {
              final map = recommendationList[index];
              return RecommendationItemModel(
                title: map['title'],
                image: map['photo'],
                review: map['rating'],
                location: map['location'],
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          shadowColor: AppColors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
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
                  backgroundImage: AssetImage(AppImages.myPhoto),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightSpace(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomTextField(controller: _controller),
                    InkWell(
                      onTap: (){
                        Navigator.of(context,rootNavigator: true).pushNamed(AppRoutes.filterScreen,arguments: "Paris");
                      },
                      child: Container(
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
                    ),
                  ],
                ),
                HeightSpace(height: 32),
                Padding(
                  padding: const EdgeInsets.only(right:16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.sp),
                    child: Image.asset(
                      AppImages.homeMainPhoto,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 211.h,
                    ),
                  ),
                ),
                HeightSpace(height: 25),
                buildCategory(context),
                HeightSpace(height: 24),
                buildRecommendationWidget(),
                const HeightSpace(height: 24),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Available Tours", style: AppStyles.addressesTextStyle),
                      InkWell(
                        child: Text("ViewAll", style: AppStyles.viewAllStyle),
                      ),
                    ],
                  ),
                ),
                const HeightSpace(height: 16),
                ListView.builder(
                    itemCount: availableTourList.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                  return AvailableTourItem(tourItemModel: availableTourList[index]);
                },

                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
