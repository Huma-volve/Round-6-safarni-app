import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/boarding_container.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/custom_button_flight_widget.dart';

class BoardingPassView extends StatelessWidget {
  const BoardingPassView({
    required this.date,
    required this.seatNumber,
    required this.startTime,
    required this.endTime,
    required this.month,
    super.key,
  });

  final int seatNumber;
  final String startTime;
  final String endTime;
  final String month;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.grey900),
        ),
        backgroundColor: AppColors.white,
        title: Text(
          'Boarding Pass',
          style: AppStyles.font14Meduim.copyWith(
            fontSize: 18,
            color: AppColors.grey900,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(AppIcons.shadow),
            BoardingContainer(
              date: date,
              time: '13:00',
              startTime: startTime,
              endTime: endTime,
              month: month,

              seatNumber: seatNumber,
            ),

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
