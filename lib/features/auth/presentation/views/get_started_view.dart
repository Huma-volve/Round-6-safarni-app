import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_size.dart';
import 'package:safarni/core/constant/app_strings.dart';
import 'package:safarni/core/widgets/custom_button_widget.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/auth/presentation/views/login_view.dart';
import 'package:safarni/features/auth/presentation/views/widgets/details_about_safarni.dart';
import 'package:safarni/features/auth/presentation/views/widgets/logo_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/safarni_text_weidget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/welcome_text_widget.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSize.padHorizantal16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: LogoWidget()),
              SliverToBoxAdapter(child: VerticalSpace(height: 8.h)),
              const SliverToBoxAdapter(child: SafarniTextWidget()),
              SliverToBoxAdapter(child: VerticalSpace(height: 48.h)),
              const SliverToBoxAdapter(child: WelocomeTextWidget()),
              SliverToBoxAdapter(child: VerticalSpace(height: 16.h)),
              const SliverToBoxAdapter(child: DetailsAboutSafarni()),
              SliverToBoxAdapter(child: VerticalSpace(height: 24.h)),
              SliverToBoxAdapter(child: CustomButtonWidget(onPressed: () {})),
              SliverToBoxAdapter(child: VerticalSpace(height: 24.h)),
              SliverToBoxAdapter(
                child: CustomButtonWidget(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
                  },
                  backgroundColor: Colors.white,
                  borderColor: AppColors.primary,
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
