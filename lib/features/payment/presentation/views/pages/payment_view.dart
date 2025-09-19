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
import 'package:safarni/features/payment/presentation/cubit/checkout/checkout_cubit.dart';
import 'package:safarni/features/payment/presentation/cubit/checkout/checkout_state.dart';
import 'package:safarni/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:safarni/features/payment/presentation/views/pages/payment_data_view.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({
    required this.bookingId,
    required this.bookingType,
    super.key,
  });

  final int bookingId;
  final String bookingType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.grey900),
        ),
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
            BlocListener<PaymentCubit, PaymentState>(
              listener: (context, state) {
                if (state is PaymentSuccess) {
                  print('Payment Sucess');
                  Navigator.pushNamed(context, AppRoutes.paymentDataRouteName);
                }
                if (state is PaymentError) {
                  if (state.errorMessage !=
                      'The payment flow has been canceled') {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                    print(state.errorMessage);
                  } else {
                    print(state.errorMessage);
                  }
                }
              },
              child: GestureDetector(
                onTap: () {
                  final PaymentIntentInputModel paymentIntentInputModel =
                      PaymentIntentInputModel(
                        currency: 'USD',
                        amount: '100',
                        customerId: 'cus_T5I1RNf6rSpw42',
                      );
                  BlocProvider.of<PaymentCubit>(context).makePayment(
                    paymentIntentInputModel: paymentIntentInputModel,
                  );
                },
                child: Row(
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
              ),
            ),
            BlocListener<CheckoutCubit, CheckOutState>(
              listener: (context, state) {
                if (state is CheckoutLoading) {
                  Center(child: CircularProgressIndicator());
                }
                Navigator.of(context, rootNavigator: true).pop();
                if (state is CheckoutFailure) {
                  Text('Error : ${state.error}');
                }
                if (state is CheckoutSuccess) {
                  Navigator.pushNamed(context, AppRoutes.paymentDataRouteName);
                  print('Success');
                }
              },
              child: CutomButtonFligthWidget(
                text: 'continue',
                margin: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                onTap: () {
                  context.read<CheckoutCubit>().paymentUseCase(
                    bookingId,
                    bookingType,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
