import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/custom_button_flight_widget.dart';

class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.grey900),
        ),
        backgroundColor: AppColors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Image.asset(AppImages.paymentSuccessImage),
          const VerticalSpace(height: 32),
          Text(
            'Payment Succeful!',
            style: AppStyles.font14Meduim.copyWith(
              color: AppColors.grey900,
              fontSize: 32,
            ),
          ),
          const VerticalSpace(height: 8),
          Text(
            'Thank you for your trust',
            style: AppStyles.font14Meduim.copyWith(fontSize: 16),
          ),
          CutomButtonFligthWidget(
            text: 'continue',
            margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            onTap: () {
              // Navigator.pushNamed(context, AppRoutes.destantionRouteName);
            },
          ),
        ],
      ),
    );
  }
}
