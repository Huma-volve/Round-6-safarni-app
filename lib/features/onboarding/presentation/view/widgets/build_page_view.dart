import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/functions/onboarding_padding_fun.dart';
import 'package:safarni/features/onboarding/data/onboarding_data.dart';

class BuildPageView extends StatelessWidget {
  const BuildPageView({
    required this.numberPage,
    required this.pageController,
    super.key,

    this.onPageChanged,
  });
  final int numberPage;
  final PageController pageController;
  final void Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: PageView.builder(
        padEnds: (numberPage == 0 || numberPage == 2) ? false : true,
        // (numberPage == 0 || numberPage == 2) ? false : true
        // pageSnapping: false,
        controller: pageController,

        onPageChanged: onPageChanged,
        itemCount: onboardingData.length,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          return Padding(
            padding: OnboardingPaddingFun.pagePadding(index),
            child: Transform.scale(
              scale: (numberPage == index) ? 1.0 : 0.85,
              child: Container(
                height: 384.h,
                width: 257.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(onboardingData[index].image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
