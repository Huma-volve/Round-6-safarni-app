import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/constants/assets.dart';
import 'package:safarni/core/widgets/custom_button_widget.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/auth/presentation/views/froget_password_view.dart';
import 'package:safarni/features/auth/presentation/views/widgets/auth_custom_text_form_flied.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/forget_password_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/have_an_account_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/or_divider_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/social__buttons.dart';

class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.email, style: AppStyles.poppins14px500WGray800),
          const VerticalSpace(height: 4),
          AuthCustomTextFormFiled(),
          const VerticalSpace(height: 18),
          Text(AppStrings.password, style: AppStyles.poppins14px500WGray800),
          const VerticalSpace(height: 4),
          AuthCustomTextFormFiled(
            hintText: '*******',
            prefixIcon: Assets.assetsImagesIconsLockIcon,
          ),
          const VerticalSpace(height: 8),
          ForgetPasswordWidget(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FrogetPasswordView(),
                ),
              );
            },
          ),
          const VerticalSpace(height: 24),
          SizedBox(
            width: double.infinity,
            child: CustomButtonWidget(onPressed: () {}),
          ),
          const VerticalSpace(height: 24),
          const OrDividerWidget(),
          const VerticalSpace(height: 24),
          const SocialButtons(),
          const VerticalSpace(height: 36),
          HaveAnAccountWidget(
            tex1: AppStrings.dontHaveAnAccount,
            text2: AppStrings.signUp,
          ),
          const VerticalSpace(height: 10),
        ],
      ),
    );
  }
}
