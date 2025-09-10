import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/custom_button_flight_widget.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/date_container_widget.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/fligth_container.dart'
    show SubtractShape;
import 'package:safarni/features/fligth_booking/presentation/views/widgets/fligth_image_widget.dart';

class SelectFlightView extends StatelessWidget {
  const SelectFlightView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FlightImageWidget(text: 'Select Your Flight'),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: DateContainerWidget(
                    text: 'Dec 16th, 2025',
                    icon: AppIcons.calendarDaysIcon,
                    margin: EdgeInsets.only(left: 16, top: 16, right: 4),
                  ),
                ),
                Flexible(
                  child: DateContainerWidget(
                    text: 'Jan 6th,2025',
                    icon: AppIcons.userIcon,
                    margin: EdgeInsets.only(right: 16, top: 16, left: 4),
                  ),
                ),
              ],
            ),
            const VerticalSpace(height: 16),
            const SubtractShape(
              time: '13:00',
              startTime: '7:05 AM',
              endTime: '8:05 PM',
              month: 'YUL',
              place: 'Scoot',
              price: '\$ 1,300',
            ),
            const SubtractShape(
              time: '13:00',
              startTime: '7:05 AM',
              endTime: '8:05 PM',
              month: 'YUL',
              place: 'Scoot',
              price: '\$ 1,300',
            ),
            const SubtractShape(
              time: '13:00',
              startTime: '7:05 AM',
              endTime: '8:05 PM',
              month: 'YUL',
              place: 'Scoot',
              price: '\$ 1,300',
              layover: '1 layover: YYZ (3:55)',
            ),
            const SubtractShape(
              time: '13:00',
              startTime: '7:05 AM',
              endTime: '8:05 PM',
              month: 'YUL',
              place: 'Scoot',
              price: '\$ 1,300',
            ),

            CutomButtonFligthWidget(
              text: 'continue',
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.chooseSeatsRouteName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
