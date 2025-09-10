import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_size.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/assets.dart';
import 'package:safarni/core/widgets/custom_button_widget.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/auth/presentation/views/login_view.dart';
import 'package:safarni/features/auth/presentation/views/widgets/auth_icon_and_text_and_sub_text.dart';

class PasswordResetView extends StatelessWidget {
  const PasswordResetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.padHorizantal16),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: VerticalSpace(height: 64)),
              SliverToBoxAdapter(
                child: AuthIconAndTextAndSubText(
                  iconPath: Assets.assetsImagesIconsGreenCorrectIcon,
                  mainText: AppStrings.passwordReset,
                  subText: AppStrings.yourPasswordHasBeenSuccessfully,
                ),
              ),
              const SliverToBoxAdapter(child: VerticalSpace(height: 16)),
              SliverToBoxAdapter(
                child: CustomButtonWidget(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
                  },
                  title: AppStrings.signIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
