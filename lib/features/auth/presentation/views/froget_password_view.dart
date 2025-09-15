import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/auth/presentation/views/widgets/auth_icon_and_text_and_sub_text.dart';
import 'package:safarni/features/auth/presentation/views/widgets/forms/forget_form_widget.dart';

class FrogetPasswordView extends StatelessWidget {
  const FrogetPasswordView({super.key});

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
                iconPath: AppIcons.assetsImagesIconsKeyIcon,
                mainText: AppStrings.forgotPassword,
                subText: AppStrings.pleaseEnterYouEmail,
              ),
            ),
            const SliverToBoxAdapter(child: VerticalSpace(height: 32)),
            SliverToBoxAdapter(child: ForgetFormWidget()),
          ],
        ),
      ),
    );
  }
}
