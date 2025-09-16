import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/constants/routes_names.dart';
import 'package:safarni/core/widgets/custom_button_widget.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/auth/presentation/views/widgets/auth_icon_and_text_and_sub_text.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/otp_send_again_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/otp_widget.dart';

class CheckYourEmailView extends StatefulWidget {
  CheckYourEmailView({super.key, this.email});
  String? email;

  @override
  State<CheckYourEmailView> createState() => _CheckYourEmailViewState();
}

class _CheckYourEmailViewState extends State<CheckYourEmailView> {
  final int _secondsRemaining = 30;
  // Timer? _timer;
  // @override
  // void initState() {
  //   // startTimer();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(AppIcons.assetsImagesIconsArrowBack),
              ),
            ),
            SliverToBoxAdapter(
              child: AuthIconAndTextAndSubText(
                iconPath: AppIcons.assetsImagesIconsEmailIcon,
                mainText: AppStrings.verifyCode,
                subText: AppStrings.pleaseEnterTheCode,
              ),
            ),
            SliverToBoxAdapter(
              child: Align(child: Text(widget.email ?? 'hhkjkk')),
            ),
            const SliverToBoxAdapter(child: VerticalSpace(height: 16)),

            SliverToBoxAdapter(
              child: Align(
                child: Text(
                  _secondsRemaining >= 0
                      ? '00:$_secondsRemaining'
                      : AppStrings.sendAgain,
                  style: AppStyles.poppins32px600WGray900.copyWith(
                    fontSize: 21.sp,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: VerticalSpace(height: 16)),
            const SliverToBoxAdapter(child: OtpWidget()),
            const SliverToBoxAdapter(child: VerticalSpace(height: 16)),
            const SliverToBoxAdapter(child: OtpSendAgainWidget()),
            const SliverToBoxAdapter(child: VerticalSpace(height: 16)),
            SliverToBoxAdapter(
              child: CustomButtonWidget(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesNames.setNewPassword);
                },
                title: AppStrings.verify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// void startTimer() {
//   _timer?.cancel();
//   _secondsRemaining = 30;
//   _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//     if (_secondsRemaining > 0) {
//       setState(() {
//         _secondsRemaining--;
//       });
//     } else {
//       _timer?.cancel();
//     }
//   });
// }
