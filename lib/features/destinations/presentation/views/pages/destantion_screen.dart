import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/utils/service_locator.dart';
import 'package:safarni/core/widgets/spacing.dart';
import 'package:safarni/features/destinations/presentation/cubit/destantion_cubit.dart';
import 'package:safarni/features/destinations/presentation/views/widgets/activity_container_widget.dart';
import 'package:safarni/features/destinations/presentation/views/widgets/add_photo_widget.dart';
import 'package:safarni/features/destinations/presentation/views/widgets/best_time_to_visit.dart';
import 'package:safarni/features/destinations/presentation/views/widgets/container_icon_widget.dart';
import 'package:safarni/features/destinations/presentation/views/widgets/price_and_booking_container.dart';
import 'package:safarni/features/destinations/presentation/views/widgets/rating_widget.dart';
import 'package:safarni/features/destinations/presentation/views/widgets/reviwe_container_widget.dart';
import 'package:safarni/features/destinations/presentation/views/widgets/see_more_button_widget.dart';

class DestantionView extends StatelessWidget {
  final int id;
  const DestantionView({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    String description = '';
    return BlocProvider(
      create: (_) => sl<DestantionCubit>()
        ..getDestantion(id)
        ..getReviews(id)
        ..getActivities(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<DestantionCubit, DestantionState>(
                buildWhen: (previous, current) =>
                    current is DestantionLoading ||
                    current is DestantionSuccess ||
                    current is DestantionError,
                builder: (context, state) {
                  if (state is DestantionLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DestantionSuccess) {
                    final dest = state.destantion;
                    description = dest.description;
                    return Stack(
                      children: [
                        Image.network(
                          dest.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),

                        const Positioned(
                          top: 60,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ContainerIconWidget(
                                margin: EdgeInsets.only(left: 20),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: AppColors.oil_11Color,
                                  size: 18,
                                ),
                              ),
                              ContainerIconWidget(
                                margin: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.favorite,
                                  color: AppColors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 155,

                          child: Container(
                            width: 80,
                            height: 35,
                            decoration: BoxDecoration(
                              color: AppColors.grey400.withValues(
                                red: 0.8,
                                green: 0.8,
                                blue: 0.8,
                                alpha: 0.9,
                              ),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Row(
                              spacing: 4,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.pictureIcon,
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '1',
                                    style: AppStyles.font18Bold,
                                    children: [
                                      TextSpan(
                                        text: '/1',
                                        style: AppStyles.font18Bold.copyWith(
                                          color: AppColors.grey500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is DestantionError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Text('error from destantion');
                  }
                },
              ),
              const HeightSpace(height: 16),
              BlocBuilder<DestantionCubit, DestantionState>(
                buildWhen: (previous, current) =>
                    current is ActivitiesLoading ||
                    current is ActivitiesSuccess ||
                    current is ActivitiesError,
                builder: (context, state) {
                  if (state is ActivitiesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ActivitiesSuccess) {
                    final activity = state.activities[0];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            spacing: 3,
                            children: [
                              Text(
                                'City Breaks',

                                style: AppStyles.font12SemiBold.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                              const Spacer(),
                              const RatingStarWidget(rating: 4.5),
                              Text(
                                '${activity.rateing.toStringAsFixed(1)}',
                                style: AppStyles.font12SemiBold.copyWith(
                                  fontSize: 16,
                                  color: AppColors.rateColor,
                                ),
                              ),
                              Text(
                                '(675)',
                                style: AppStyles.font12SemiBold.copyWith(
                                  color: AppColors.grey700Color,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            description,
                            style: AppStyles.font12SemiBold.copyWith(
                              fontSize: 16,
                              color: AppColors.grey900,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            top: 8,
                            bottom: 8,
                          ),
                          child: Text(
                            '5 Days and 4 Nights',
                            style: AppStyles.font14Meduim,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            top: 8,
                            bottom: 16,
                          ),
                          child: Text(
                            activity.location,
                            style: AppStyles.font14Meduim.copyWith(
                              fontSize: 12,
                              color: AppColors.grey500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Top Activates',
                            style: AppStyles.font14Meduim.copyWith(
                              fontSize: 17,
                              color: AppColors.grey900,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: state.activities.length,
                            itemBuilder: (context, index) {
                              final activity = state.activities[index];
                              return ActivityContainerWidget(
                                image: activity.image,
                                title: activity.name,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 16,
                            bottom: 8,
                          ),
                          child: Text(
                            'Best Time to Visit',
                            style: AppStyles.font14Meduim.copyWith(
                              fontSize: 17,
                              color: AppColors.grey900,
                            ),
                          ),
                        ),

                        BestTimeToVisiteContainer(
                          title: activity.bestTimetoVisit,
                        ),
                      ],
                    );
                  } else if (state is ActivitiesError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                  return const Text('Error from activities');
                },
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Gallery',
                        style: AppStyles.font14Meduim.copyWith(
                          fontSize: 17,
                          color: AppColors.grey900,
                        ),
                        children: [
                          TextSpan(
                            text: '(200)',
                            style: AppStyles.font14Meduim.copyWith(
                              fontSize: 17,
                              color: AppColors.blue700Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'See more',
                      style: AppStyles.font14Meduim.copyWith(
                        fontSize: 15,
                        color: AppColors.blue700Color,
                      ),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                padding: const EdgeInsets.all(16),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.25,
                ),
                itemBuilder: (context, index) =>
                    Image.asset(AppImages.galleryImage, fit: BoxFit.contain),
              ),

              const AddPhotoWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Reviews',
                  style: AppStyles.font14Meduim.copyWith(
                    fontSize: 17,
                    color: AppColors.grey900,
                  ),
                ),
              ),
              BlocBuilder<DestantionCubit, DestantionState>(
                buildWhen: (previous, current) =>
                    current is ReviewsLoading ||
                    current is ReviewsSuccess ||
                    current is ReviewsError,
                builder: (context, state) {
                  if (state is ReviewsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ReviewsSuccess) {
                    return Column(
                      children: state.reviews.map((review) {
                        return ReviewContainerWidget(
                          margin: const EdgeInsets.all(8),
                          userName: review.user.name,
                          reviewText: review.review,
                          rating: review.rating,
                        );
                      }).toList(),
                    );
                  } else if (state is ReviewsError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                  return const Text('Error frpm reviews');
                },
              ),
              const SeeMoreButtonWidget(),
              const PriceAndBookingContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
