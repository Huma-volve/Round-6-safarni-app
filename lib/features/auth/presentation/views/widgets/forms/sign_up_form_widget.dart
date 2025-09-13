import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_strings.dart';

import 'package:safarni/core/widgets/custom_button_widget.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/auth/presentation/views/widgets/auth_custom_text_form_flied.dart';
import 'package:safarni/features/auth/presentation/views/widgets/custom_button_with_icon.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/have_an_account_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/name_text_filed.dart';
import 'package:safarni/features/auth/presentation/views/widgets/or_divider_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/required_rules_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/social__buttons.dart';

class SignUpFormWidget extends StatelessWidget {
  SignUpFormWidget({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameTextFormFiled(name: AppStrings.name),
          const VerticalSpace(height: 4),
          AuthCustomTextFormFiled(
            prefixIcon: AppIcons.assetsImagesIconsPersonIcon,
          ),
          const VerticalSpace(height: 16),
          NameTextFormFiled(name: AppStrings.email),
          const VerticalSpace(height: 4),
          AuthCustomTextFormFiled(),
          const VerticalSpace(height: 16),
          NameTextFormFiled(name: AppStrings.password),
          const VerticalSpace(height: 4),
          AuthCustomTextFormFiled(
            hintText: '*******',
            prefixIcon: AppIcons.assetsImagesIconsLockIcon,
          ),
          const VerticalSpace(height: 16),
          const RequiredRulesWidget(),
          const VerticalSpace(height: 24),
          SizedBox(
            width: double.infinity,
            child: CustomButtonWidget(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.customButtomNavBar,
                  (route) => true,
                );
              },
            ),
          ),
          const VerticalSpace(height: 24),
          const OrDividerWidget(),
          const VerticalSpace(height: 24),
          CustomButtonWithIcon(
            onPressed: () {},
            icon: AppIcons.assetsImagesIconsGoogleIcon,
            title: AppStrings.signUpWithGoogle,
          ),
          const VerticalSpace(height: 12),
          CustomButtonWithIcon(
            onPressed: () {},
            icon: AppIcons.assetsImagesIconsFacebookIcon,
            title: AppStrings.signUpWithFacebook,
          ),
          const VerticalSpace(height: 12),
          CustomButtonWithIcon(
            onPressed: () {},
            icon: AppIcons.assetsImagesIconsAppleIcon,
            title: AppStrings.signUpWithApple,
          ),
          const VerticalSpace(height: 36),
          HaveAnAccountWidget(
            tex1: AppStrings.alreadyHaveAnAccount,
            text2: AppStrings.signIn,
          ),
          const VerticalSpace(height: 10),
        ],
      ),
    );
  }
}
