import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/custom_button_flight_widget.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/label_and_textbox_widget.dart';

class PaymentDataView extends StatelessWidget {
  const PaymentDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
        leading: const Icon(Icons.arrow_back_ios_new, color: AppColors.grey900),
        backgroundColor: AppColors.white,
        title: Text(
          'Payment Methed',
          style: AppStyles.font14Meduim.copyWith(
            fontSize: 18,
            color: AppColors.grey900,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Your\nPayment Methed',
                style: AppStyles.font14Meduim.copyWith(
                  fontSize: 22,
                  color: AppColors.grey700Color,
                ),
              ),
              Image.asset(
                AppImages.creditCardImage,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    PaymentMethodContainerWidget(
                      text: 'Paypal',
                      icon: AppIcons.paypalIcon,
                    ),
                    PaymentMethodContainerWidget(
                      text: 'Mastercard',
                      icon: AppIcons.masterCardIcon,
                    ),
                    PaymentMethodContainerWidget(
                      text: 'Visa',
                      icon: AppIcons.visaIcon,
                    ),
                  ],
                ),
              ),
              LabelAndTextBoxWidget(hint: 'Amira Elezaby', label: 'Full Name'),
              LabelAndTextBoxWidget(
                hint: 'amiraelezaby109@gmail.com',
                label: 'Your Email',
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: LabelAndTextBoxWidget(
                      suffixIcon: Transform.scale(
                        scale: 0.6,
                        child: SvgPicture.asset(
                          color: AppColors.grey400,
                          AppIcons.calendarDaysIcon,
                          width: 8,
                          height: 8,
                          fit: BoxFit.fill,
                        ),
                      ),

                      hint: '12-6-2024',
                      label: 'Valid Date',
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: LabelAndTextBoxWidget(
                      suffixIcon: Transform.scale(
                        scale: 0.5,
                        child: SvgPicture.asset(
                          AppIcons.windowicon,
                          width: 8,
                          height: 8,
                          fit: BoxFit.cover,
                        ),
                      ),
                      hint: '562',
                      label: 'CVV',
                    ),
                  ),
                ],
              ),
              CutomButtonFligthWidget(
                text: 'continue',
                margin: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.paymentSuccessRouteName,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentMethodContainerWidget extends StatelessWidget {
  const PaymentMethodContainerWidget({
    super.key,
    required this.icon,
    required this.text,
  });
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.grey100Color.withOpacity(0.4),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        spacing: 8,
        children: [
          SvgPicture.asset(icon),
          Text(text, style: AppStyles.font14Meduim),
        ],
      ),
    );
  }
}
