import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_size.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/features/auth/presentation/views/widgets/auth_icon_and_text_and_sub_text.dart';
import 'package:safarni/features/auth/presentation/views/widgets/forms/set_new_password_form_widget.dart';

class SetNewPasswordView extends StatelessWidget {
  const SetNewPasswordView({super.key});

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
                iconPath: AppIcons.assetsImagesIconsLockIcon,
                mainText: AppStrings.setNewPassword,
                subText: AppStrings.yourNewPasswordMustBe,
              ),
            ),
            SliverToBoxAdapter(child: SetNewPasswordFormWidget()),
          ],
        ),
      ),
    );
  }
}
