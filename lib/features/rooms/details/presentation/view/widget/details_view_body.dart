import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_size.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/loading/custom_spinkit_loading.dart';
import 'package:safarni/core/widgets/custom_cached_network_image.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/custom_discount.dart';
import 'package:safarni/features/rooms/details/presentation/view/manager/room_details_cubit/room_details_cubit.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_book_now.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_details_arrow_back.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_details_image_group_list.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_page_view.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_rate_and_review.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/tab_list_header.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({required this.hotelsEntity, super.key});
  final HotelsEntity hotelsEntity;
  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  late PageController pageController;
  int pageControllerIndex = 0;

  int selectedIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      pageControllerIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomDetailsCubit, RoomDetailsState>(
      builder: (context, state) {
        if (state is RoomDetailsSuccess) {
          final List<String> images = [
            state.roomDetailsEntities.image,
            state.roomDetailsEntities.image,
            state.roomDetailsEntities.image,
            state.roomDetailsEntities.image,
            state.roomDetailsEntities.image,
            state.roomDetailsEntities.image,
            state.roomDetailsEntities.image,
          ];
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .34,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned.fill(
                          child: CustomCachedNetworkImage(
                            borderRadius: BorderRadius.zero,
                            image: images[selectedIndex],
                          ),
                        ),
                        const Positioned(
                          top: 52,
                          left: 20,
                          child: CustomDetailsArrowBack(),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 0,
                          right: 0,
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height * .07,

                            child: CustomDetailsImagesGroupList(
                              images: images,
                              onImageTap: (index) {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              selectedIndex: selectedIndex,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.padding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomRoomDiscount(
                                discount: state.roomDetailsEntities.discount,
                              ),
                              const Spacer(),
                              CustomRateAndReview(
                                primeContext: context,
                                averageRating:
                                    state.roomDetailsEntities.averageRating,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            widget.hotelsEntity.name,
                            style: AppStyles.textMedium20(
                              context: context,
                            ).copyWith(color: AppColors.primaryColor),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            widget.hotelsEntity.location,
                            style: AppStyles.textRegular13(context: context)
                                .copyWith(
                                  color: AppColors.fifthColor,
                                  height: 1.23,
                                ),
                          ),
                          const SizedBox(height: 16),
                          TapListHeader(pageController: pageController),
                          const SizedBox(height: 24),
                          Expanded(
                            child: CustomPageView(
                              hotelEntity: widget.hotelsEntity,
                              pageController: pageController,
                              roomDetailsEntity: state.roomDetailsEntities,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: CustomBookNow(
                  hotelsEntity: widget.hotelsEntity,
                  primeContext: context,
                  roomDetailsEntity: state.roomDetailsEntities,
                ),
              ),
            ],
          );
        } else if (state is RoomDetailsFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const CustomSpinkitLoading();
        }
      },
    );
  }
}
