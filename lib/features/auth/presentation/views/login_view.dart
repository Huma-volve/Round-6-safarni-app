import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_strings.dart';
import 'package:safarni/core/constant/app_style.dart';
import 'package:safarni/core/widgets/custom_button_widget.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/auth/presentation/views/widgets/details_about_safarni.dart';
import 'package:safarni/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/logo_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/welcome_text_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: LogoWidget(height: 60.h, width: 75.w),
            ),
            SliverToBoxAdapter(
              child: WelocomeTextWidget(
                title: AppStrings.welcomeAgain,
                style: AppStyle.poppins32px600WGray900.copyWith(
                  fontSize: 18.sp,
                ),
              ),
            ),
            SliverToBoxAdapter(child: DetailsAboutSafarni()),
            SliverToBoxAdapter(
              child: Text(
                AppStrings.email,
                style: AppStyle.poppins14px500WGray800,
              ),
            ),
            SliverToBoxAdapter(child: AuthCustomTextFormFiled()),
            SliverToBoxAdapter(
              child: Text(
                AppStrings.password,
                style: AppStyle.poppins14px500WGray800,
              ),
            ),
            SliverToBoxAdapter(child: AuthCustomTextFormFiled()),
            SliverToBoxAdapter(child: ForgetPasswordWidget()),
            SliverToBoxAdapter(child: CustomButtonWidget(onPressed: () {})),
            SliverToBoxAdapter(child: OrDividerWidget()),
            SliverToBoxAdapter(
              child: HaveAnAccountWidget(
                tex1: AppStrings.dontHaveAnAccount,
                text2: AppStrings.signUp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrDividerWidget extends StatelessWidget {
  OrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.gray800, thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 11.w),
          child: Text(
            "Or",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.gray800,
            ),
          ),
        ),
        Expanded(child: Divider(color: AppColors.gray800, thickness: 1)),
      ],
    );
  }
}

class AuthCustomTextFormFiled extends StatelessWidget {
  const AuthCustomTextFormFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.gray300),
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        AppStrings.forgotPassword,
        style: AppStyle.poppins24px600WGray800.copyWith(fontSize: 13.sp),
      ),
    );
  }
}
