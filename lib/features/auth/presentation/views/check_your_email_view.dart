import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_size.dart';
import 'package:safarni/core/constant/app_strings.dart';
import 'package:safarni/core/constant/app_style.dart';
import 'package:safarni/core/constant/assets.dart';
import 'package:safarni/core/constant/routes_names.dart';
import 'package:safarni/core/widgets/custom_button_widget.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/auth/presentation/views/set_new_password_view.dart';
import 'package:safarni/features/auth/presentation/views/widgets/auth_icon_and_text_and_sub_text.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/otp_send_again_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/otp_widget.dart';

class CheckYourEmailView extends StatefulWidget {
  const CheckYourEmailView({super.key});

  @override
  State<CheckYourEmailView> createState() => _CheckYourEmailViewState();
}

class _CheckYourEmailViewState extends State<CheckYourEmailView> {
  int _secondsRemaining = 30;
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
        padding: EdgeInsets.symmetric(horizontal: AppSize.padHorizantal16),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(Assets.assetsImagesIconsArrowBack),
              ),
            ),

            SliverToBoxAdapter(
              child: AuthIconAndTextAndSubText(
                iconPath: Assets.assetsImagesIconsEmailIcon,
                mainText: AppStrings.verifyCode,
                subText: AppStrings.pleaseEnterTheCode,
              ),
            ),
            const SliverToBoxAdapter(child: VerticalSpace(height: 16)),
            SliverToBoxAdapter(
              child: Align(
                child: Text(
                  _secondsRemaining >= 0
                      ? '00:$_secondsRemaining'
                      : AppStrings.sendAgain,
                  style: AppStyle.poppins32px600WGray900.copyWith(
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