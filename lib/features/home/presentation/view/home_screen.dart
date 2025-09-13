import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/widgets/custom_text_field.dart';
import 'package:safarni/core/widgets/spacing.dart';
import 'package:safarni/features/home/presentation/business_logic/available_tours/available_tours_cubit.dart';
import 'package:safarni/features/home/presentation/business_logic/recommended_tours/recommended_tours_cubit.dart';
import 'package:safarni/features/home/presentation/widgets/available_tour_item.dart';
import 'package:safarni/features/home/presentation/widgets/category_item.dart';
import 'package:safarni/features/home/presentation/widgets/recommendation_item_model.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../../data/models/category_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _controller = TextEditingController();


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
          child: BlocBuilder<RecommendedToursCubit, RecommendedToursState>(
            buildWhen: (previous,current)=>current is CategoriesLoading || current is CategoriesLoaded,
  builder: (context, state) {
    if(state is CategoriesLoading){
      return circularProgressWidget();
    }
    else if(state is CategoriesLoaded){
      return  ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: itemWidth,
            child: CategoryItem(
              onTap: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(categoriesList[index].route);
              },
              title: categoriesList[index].title,
              image: categoriesList[index].image,
            ),
          );
        },
      );
    }
    else {
      return const SizedBox.shrink();
    }

  },
),
        ),
      ],
    );
  }
  Widget circularProgressWidget(){
    return Center(child: CircularProgressIndicator.adaptive(backgroundColor: AppColors.viewAllColor),);
}
  Widget buildRecommendationWidget() {
    return BlocBuilder<RecommendedToursCubit, RecommendedToursState>(
      buildWhen:(previous,current)=>current is RecommendedToursLoading || current is RecommendedToursLoaded || current is RecommendedToursError,
  builder: (context, state) {
    if(state is RecommendedToursLoading || state is RecommendedToursInitial){
      return circularProgressWidget();
    }
    else if(state is RecommendedToursLoaded){
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
            height:  MediaQuery.of(context).size.height*.33,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.tours.length,
              itemBuilder: (context, index) {
                final constant=state.tours[index];
                return RecommendationItemModel(
                  title:constant.title,
                  image: constant.image,
                  review: constant.rating.toString(),
                  location: constant.location,
                );
              },
            ),
          ),
        ],
      );
    }
    else if(state is RecommendedToursError){
      return Center(child: Text(state.error),);
    }
    else {
      return const SizedBox.shrink();
    }

  },
);
  }
 Widget buildAvailableTours(){
    return Column(
      children: [
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
        BlocBuilder<AvailableToursCubit, AvailableToursState>(
  builder: (context, state) {
    if(state is AvailableToursLoading){
      return circularProgressWidget();
    }
    else if(state is AvailableToursLoaded){
      return ListView.builder(
        itemCount: state.availableTours.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return AvailableTourItem(availableTourModel:state.availableTours[index]);
        },

      );
    }
    else if(state is AvailableToursError){
      return Center(child: Text(state.error),);
    }
    else{
      return const SizedBox.shrink();
    }

  },
)
      ],
    );
 }
  
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>RecommendedToursCubit()..getRecommendedTours()..getCategories()),
          BlocProvider(create: (_)=>AvailableToursCubit()..getAllAvailableTours()),
        ],
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
                onTap: () {
                  Navigator.of(context,rootNavigator: true).pushNamed(AppRoutes.profile);
                },
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
                  buildAvailableTours()
                 

                ],
              ),
    )
          )
        )
      )
    );
  }
}
