import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/custom_button_flight_widget.dart';
import 'package:safarni/features/payment/data/models/payment_intent_input_model.dart';
import 'package:safarni/features/payment/presentation/cubit/payment_cubit.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                children: const [
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
            const Spacer(),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add Card',
                  style: AppStyles.font14Meduim.copyWith(
                    fontSize: 18,
                    color: AppColors.grey900,
                  ),
                ),
                SvgPicture.asset(AppIcons.addIcon),
              ],
            ),
            BlocConsumer<PaymentCubit, PaymentState>(
              listener: (context, state) {
                if (state is PaymentSuccess) {
                  print('Payment Sucess');
                  Navigator.pushNamed(context, AppRoutes.paymentDataRouteName);
                }
                if (state is PaymentError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                  print(state.errorMessage);
                }
              },
              builder: (context, state) {
                return CutomButtonFligthWidget(
                  text: 'continue',
                  margin: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 16,
                  ),
                  onTap: () {
                    final PaymentIntentInputModel paymentIntentInputModel =
                        PaymentIntentInputModel(
                          currency: 'USD',
                          amount: '100',
                          customerId: 'cus_T4qU5EW8IfaOwa',
                        );
                    BlocProvider.of<PaymentCubit>(context).makePayment(
                      paymentIntentInputModel: paymentIntentInputModel,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodContainerWidget extends StatelessWidget {
  const PaymentMethodContainerWidget({
    required this.icon,
    required this.text,
    super.key,
  });
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
