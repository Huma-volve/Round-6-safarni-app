import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_size.dart';
import 'package:safarni/core/constant/app_strings.dart';
import 'package:safarni/core/constant/assets.dart';
import 'package:safarni/features/auth/presentation/views/widgets/auth_icon_and_text_and_sub_text.dart';
import 'package:safarni/features/auth/presentation/views/widgets/forms/set_new_password_form_widget.dart';

class SetNewPasswordView extends StatelessWidget {
  const SetNewPasswordView({super.key});

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
                iconPath: Assets.assetsImagesIconsLockIcon,
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
