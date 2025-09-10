import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/custom_button_flight_widget.dart';

class ChooseSeatsView extends StatelessWidget {
  const ChooseSeatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new, color: AppColors.grey900),
        backgroundColor: AppColors.white,
        title: Text(
          'choose Seats',
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
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ColorContainerWidget(
                  color: AppColors.blue700Color,
                  text: 'Available',
                ),
                ColorContainerWidget(
                  color: Color(0xff03D947),
                  text: 'Selected',
                ),
                ColorContainerWidget(
                  color: Color(0xffD1D5DB),
                  text: 'Un available',
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                spacing: 16,
                children: [
                  SeatNumberContainerWidget(
                    number: 1,
                    color: AppColors.grey200,
                  ),
                  SeatNumberContainerWidget(
                    number: 2,
                    color: AppColors.grey200,
                  ),
                  Spacer(),
                  SeatNumberContainerWidget(
                    number: 3,
                    color: AppColors.grey200,
                  ),
                  SeatNumberContainerWidget(
                    number: 4,
                    color: AppColors.blue700Color,
                  ),
                  SeatNumberContainerWidget(
                    number: 5,
                    color: AppColors.grey200,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                spacing: 16,
                children: [
                  SeatNumberContainerWidget(
                    number: 6,
                    color: Color(0xff03D947),
                  ),
                  SeatNumberContainerWidget(
                    number: 7,
                    color: AppColors.grey200,
                  ),
                  Spacer(),
                  SeatNumberContainerWidget(
                    number: 8,
                    textColor: AppColors.white,
                    color: AppColors.blue700Color,
                  ),
                  SeatNumberContainerWidget(
                    number: 9,
                    textColor: AppColors.white,
                    color: AppColors.blue700Color,
                  ),
                  SeatNumberContainerWidget(
                    number: 10,
                    textColor: AppColors.white,
                    color: AppColors.blue700Color,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                spacing: 16,
                children: [
                  SeatNumberContainerWidget(
                    number: 11,
                    color: AppColors.grey200,
                  ),
                  SeatNumberContainerWidget(
                    number: 12,
                    color: AppColors.grey200,
                  ),
                  Spacer(),
                  SeatNumberContainerWidget(
                    number: 13,
                    color: AppColors.grey200,
                  ),
                  SeatNumberContainerWidget(
                    number: 14,
                    color: AppColors.grey200,
                  ),
                  SeatNumberContainerWidget(
                    number: 15,
                    color: AppColors.grey200,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                spacing: 16,
                children: [
                  SeatNumberContainerWidget(
                    number: 16,
                    textColor: AppColors.white,
                    color: AppColors.blue700Color,
                  ),
                  SeatNumberContainerWidget(
                    number: 17,
                    textColor: AppColors.white,
                    color: AppColors.blue700Color,
                  ),
                  Spacer(),
                  SeatNumberContainerWidget(
                    number: 18,
                    color: AppColors.grey200,
                  ),
                  SeatNumberContainerWidget(
                    number: 19,

                    color: AppColors.grey200,
                  ),
                  SeatNumberContainerWidget(
                    number: 20,
                    textColor: AppColors.white,
                    color: AppColors.blue700Color,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                spacing: 16,
                children: [
                  SeatNumberContainerWidget(
                    number: 21,
                    color: AppColors.grey200,
                  ),
                  SeatNumberContainerWidget(
                    number: 22,
                    color: AppColors.grey200,
                  ),
                  Spacer(),
                  SeatNumberContainerWidget(
                    number: 23,
                    color: AppColors.grey200,
                  ),
                  SeatNumberContainerWidget(
                    number: 24,
                    textColor: AppColors.white,
                    color: AppColors.blue700Color,
                  ),
                  SeatNumberContainerWidget(
                    number: 25,
                    color: AppColors.grey200,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                spacing: 16,
                children: [
                  SeatNumberContainerWidget(
                    number: 26,
                    textColor: AppColors.white,
                    color: AppColors.blue700Color,
                  ),
                  SeatNumberContainerWidget(
                    number: 27,
                    color: AppColors.grey200,
                  ),
                  Spacer(),
                  SeatNumberContainerWidget(
                    number: 28,
                    textColor: AppColors.white,
                    color: AppColors.blue700Color,
                  ),
                  SeatNumberContainerWidget(
                    number: 29,
                    textColor: AppColors.white,
                    color: AppColors.blue700Color,
                  ),
                  SeatNumberContainerWidget(
                    number: 30,
                    color: AppColors.grey200,
                  ),
                ],
              ),
            ),
            const VerticalSpace(height: 6),
            RowTextOfPriceWidget(title: 'Ticket price', price: '\$150.00'),
            RowTextOfPriceWidget(title: 'Total Price', price: '\$150.00'),
            RowTextOfPriceWidget(title: 'your Seat', price: '6'),
            CutomButtonFligthWidget(
              text: 'continue',
              margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.paymentRouteName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RowTextOfPriceWidget extends StatelessWidget {
  const RowTextOfPriceWidget({
    required this.title,
    required this.price,
    super.key,
  });
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppStyles.font15Regular.copyWith(fontSize: 14)),
          Text(
            price,
            style: AppStyles.font12SemiBold.copyWith(
              fontSize: 16,
              color: AppColors.blue700Color,
            ),
          ),
        ],
      ),
    );
  }
}

class SeatNumberContainerWidget extends StatelessWidget {
  const SeatNumberContainerWidget({
    required this.number,
    required this.color,
    this.textColor,
    super.key,
  });
  final int number;
  final Color color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 39,
      height: 39,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          '$number',
          textAlign: TextAlign.center,
          style: AppStyles.font15Regular.copyWith(color: textColor),
        ),
      ),
    );
  }
}

class ColorContainerWidget extends StatelessWidget {
  const ColorContainerWidget({
    required this.color,
    required this.text,
    super.key,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        Text(text, style: AppStyles.font15Regular),
      ],
    );
  }
}
