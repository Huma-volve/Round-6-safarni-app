import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/assets.dart';
import 'package:safarni/core/constants/routes_names.dart';

import 'package:safarni/core/widgets/custom_button_widget.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/auth/presentation/views/widgets/auth_custom_text_form_flied.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/back_to_login_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/name_text_filed.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/required_rules_widget.dart';

class SetNewPasswordFormWidget extends StatelessWidget {
  SetNewPasswordFormWidget({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpace(height: 6),
          NameTextFormFiled(name: AppStrings.password),
          const VerticalSpace(height: 4),
          AuthCustomTextFormFiled(),
          const VerticalSpace(height: 16),
          NameTextFormFiled(name: AppStrings.confirmPassword),
          const VerticalSpace(height: 4),
          AuthCustomTextFormFiled(
            hintText: '*******',
            prefixIcon: Assets.assetsImagesIconsLockIcon,
          ),
          const VerticalSpace(height: 42),
          const RequiredRulesWidget(),
          const VerticalSpace(height: 6),
          SizedBox(
            width: double.infinity,
            child: CustomButtonWidget(
              onPressed: () =>
                  Navigator.pushNamed(context, RoutesNames.passwordResetView),

              title: AppStrings.resetPassword,
            ),
          ),
          const VerticalSpace(height: 24),
          const BackToLoginWidget(),
        ],
      ),
    );
  }
}
