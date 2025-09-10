import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/assets.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/auth/presentation/views/widgets/forms/login_form_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/forms/sign_up_form_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/welcome_back_and_subtitle_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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

            const SliverToBoxAdapter(child: VerticalSpace(height: 36)),
            const SliverToBoxAdapter(child: WelcomeBackAndSubtitleWidget()),
            const SliverToBoxAdapter(child: VerticalSpace(height: 8)),
            SliverToBoxAdapter(child: SignUpFormWidget()),
          ],
        ),
      ),
    );
  }
}
