import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_size.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/custom_discount.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_book_now.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_details_arrow_back.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_details_image_group_list.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_page_view.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_rate_and_review.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/tab_list_header.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({super.key});

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  late PageController pageController;
  int pageControllerIndex = 0;
  final List<String> images = [
    AppImages.imagesTest3,
    AppImages.imagesTest7,
    AppImages.imagesTest3,
    AppImages.imagesTest7,
    AppImages.imagesTest3,
    AppImages.imagesTest7,
    AppImages.imagesTest3,
  ];
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .34,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: Image.asset(images[selectedIndex], fit: BoxFit.cover),
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
            padding: const EdgeInsets.symmetric(horizontal: AppSize.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [CustomDiscount(), Spacer(), CustomRateAndReview()],
                ),
                const SizedBox(height: 16),
                Text(
                  'HarborHaven HIdeaway',
                  style: AppStyles.textMedium20.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '1012 oscean avanue, New Yourk ,USA',
                  style: AppStyles.textRegular13.copyWith(
                    color: AppColors.fifthColor,
                    height: 1.23,
                  ),
                ),
                const SizedBox(height: 16),
                TapListHeader(pageController: pageController),
                const SizedBox(height: 24),
                Expanded(child: CustomPageView(pageController: pageController)),
              ],
            ),
          ),
        ),
        const CustomBookNow(),
      ],
    );
  }
}
