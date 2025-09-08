// import 'package:flutter/material.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:safarni/core/constant/app_colors.dart';

// import 'package:safarni/core/constant/assets.dart';

// import 'package:safarni/core/widgets/spacing/vertical_space.dart';

// import 'package:safarni/features/onboarding/presentation/view/widgets/custom_nav_bar_widget.dart';

// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class OnboardingView extends StatelessWidget {
//   const OnboardingView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             const SliverToBoxAdapter(child: CustomNavWidget()),

//             SliverToBoxAdapter(child: OnboardingBody()),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class OnboardingBody extends StatefulWidget {
//   const OnboardingBody({super.key});

//   @override
//   State<OnboardingBody> createState() => _OnboardingBodyState();
// }

// class _OnboardingBodyState extends State<OnboardingBody> {
//   final PageController controller = PageController(viewportFraction: .7);

//   int numberPage = 0;

//   // قائمة الصور (تأكد من وجود هذه الملفات)

//   final List<String> images = [
//     Assets.assetsImagesOnboardingImg1,

//     // Assets.assetsImagesOnboardingImg2,

//     // Assets.assetsImagesOnboardingImg3,
//   ];

//   // قائمة العناوين (اختيارية)

//   final List<String> titles = [
//     'مرحباً بك في سافرني',

//     'اكتشف أجمل الأماكن',

//     'ابدأ رحلتك الآن',
//   ];

//   @override
//   void dispose() {
//     controller.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.7, // ارتفاع متجاوب

//       child: Column(
//         children: [
//           Expanded(
//             child: PageView.builder(
//               padEnds: false,

//               controller: controller,

//               onPageChanged: (numPage) {
//                 setState(() {
//                   numberPage = numPage; // تحديث الحالة بشكل صحيح
//                 });

//                 print('Current page: $numberPage');
//               },

//               itemCount: 3,

//               clipBehavior: Clip.none,

//               itemBuilder: (context, index) {
//                 return Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,

//                     children: [
//                       // الصورة مع تأثير التكبير
//                       AnimatedContainer(
//                         duration: const Duration(milliseconds: 300),

//                         curve: Curves.easeInOut,

//                         transform: Matrix4.identity()
//                           ..scale(numberPage == index ? 1.2 : 0.9),

//                         child: SizedBox(
//                           height: 308.h,

//                           width: 256.w,

//                           child: Image.asset(
//                             // استخدام الصورة المناسبة أو الافتراضية
//                             index < images.length
//                                 ? images[index]
//                                 : Assets.assetsImagesOnboardingImg1,

//                             fit: BoxFit
//                                 .contain, // تغيير إلى contain للحفاظ على النسبة

//                             errorBuilder: (context, error, stackTrace) {
//                               return Container(
//                                 height: 308.h,

//                                 width: 256.w,

//                                 color: AppColors.gray200,

//                                 child: Icon(
//                                   Icons.image_not_supported,

//                                   size: 50.sp,

//                                   color: AppColors.gray200,
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),

//                       VerticalSpace(height: 20.h),

//                       // العنوان (اختياري)
//                       if (index < titles.length)
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 20.w),

//                           child: Text(
//                             titles[index],

//                             textAlign: TextAlign.center,

//                             style: TextStyle(
//                               fontSize: 20.sp,

//                               fontWeight: FontWeight.bold,

//                               color: AppColors.primary,
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),

//           // مؤشر الصفحات في الأسفل
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 20.h),

//             child: SmoothPageIndicator(
//               controller: controller,

//               count: 3,

//               effect: ExpandingDotsEffect(
//                 dotHeight: 10.h,

//                 dotWidth: 12.w,

//                 activeDotColor: AppColors.primary,

//                 dotColor: AppColors.gray200,

//                 spacing: 8.w,
//               ),

//               onDotClicked: (index) {
//                 controller.animateToPage(
//                   index,

//                   duration: const Duration(milliseconds: 500),

//                   curve: Curves.easeInOut,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/assets.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/onboarding/presentation/view/widgets/custom_nav_bar_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: CustomNavWidget()),

            SliverToBoxAdapter(child: OnboardingBody()),
          ],
        ),
      ),
    );
  }
}

class OnboardingBody extends StatefulWidget {
  OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  final PageController controller = PageController(viewportFraction: .7);

  numPage() {}

  int numberPage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SizedBox(
        height: 800,
        child: PageView.builder(
          // padEnds: false,
          pageSnapping: false,
          controller: controller,
          onPageChanged: (numPage) {
            numberPage = numPage;
            print(numberPage);
            setState(() {});
          },
          itemCount: 3,
          clipBehavior: Clip.none,
          itemBuilder: (context, index) {
            return Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 31),
                    child: Transform.scale(
                      scaleY: (numberPage == index) ? 1.2.h : .9.h,
                      child: SizedBox(
                        height: 308,
                        width: 256.33331298828125,
                        child: Image.asset(
                          Assets.imagesOnboardingImg1,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  VerticalSpace(height: 20.h),
                  SmoothPageIndicator(
                    controller: controller,
                    // PageController
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotHeight: 10.h,
                      dotWidth: 12.w,
                      activeDotColor: AppColors.primary,
                      dotColor: AppColors.gray200,
                    ), // your preferred effect
                    onDotClicked: (index) {
                      // if (index != 3)
                      //   controller.nextPage(
                      //     duration: Duration(seconds: 1),
                      //     curve: Curves.easeIn,
                      //   );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
