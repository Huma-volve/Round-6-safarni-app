import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_size.dart';
import 'package:safarni/core/constant/app_style.dart';
import 'package:safarni/core/constant/assets.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/widget/custom_discount.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/custom_book_now.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/custom_details_arrow_back.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/custom_page_view.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/custom_rate_and_review.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/tab_list_header.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({super.key});

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  late PageController pageController;
  int pageControllerIndex = 0;
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
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(Assets.imagesTest3, fit: BoxFit.fill),
            const Positioned(
              top: 35,
              left: 10,
              child: CustomDetailsArrowBack(),
            ),
            Positioned(
              bottom: 10,
              child: Container(
                width: 52,
                height: 52,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Image.asset(Assets.imagesTest5, fit: BoxFit.fill),
              ),
            ),
          ],
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
                  style: AppStyle.textMedium20.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '1012 oscean avanue, New Yourk ,USA',
                  style: AppStyle.textRegular13.copyWith(
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
