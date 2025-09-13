import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_size.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/routes_names.dart';
import 'package:safarni/core/widgets/custom_button_widget.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/auth/presentation/views/login_view.dart';
import 'package:safarni/features/auth/presentation/views/sign_up_view.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/details_about_safarni.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/logo_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/safarni_text_weidget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/welcome_text_widget.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: VerticalSpace(height: 57.h)),
              SliverToBoxAdapter(child: LogoWidget()),
              SliverToBoxAdapter(child: VerticalSpace(height: 8.h)),
              const SliverToBoxAdapter(child: SafarniTextWidget()),
              SliverToBoxAdapter(child: VerticalSpace(height: 48.h)),
              const SliverToBoxAdapter(child: WelocomeTextWidget()),
              SliverToBoxAdapter(child: VerticalSpace(height: 16.h)),
              const SliverToBoxAdapter(child: DetailsAboutSafarni()),
              SliverToBoxAdapter(child: VerticalSpace(height: 24.h)),
              SliverToBoxAdapter(
                child: CustomButtonWidget(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RoutesNames.signUp,
                      (route) => true,
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(child: VerticalSpace(height: 24.h)),
              SliverToBoxAdapter(
                child: CustomButtonWidget(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RoutesNames.login,
                      (route) => true,
                    );
                  },
                  backgroundColor: Colors.white,
                  borderColor: AppColors.primary,
                  titleColor: AppColors.primary,
                  title: AppStrings.logIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
