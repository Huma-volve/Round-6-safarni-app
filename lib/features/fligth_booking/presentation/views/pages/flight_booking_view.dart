import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/custom_button_flight_widget.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/fligth_image_widget.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/label_and_textbox_widget.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/passenger_selector_widget.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/trip_type_container_widget.dart';

class FligthBookingView extends StatelessWidget {
  const FligthBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FlightImageWidget(text: 'Book Your Flight'),
            SizedBox(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  TripTypeContainerWidget(
                    margin: EdgeInsets.only(
                      left: 16,
                      right: 8,
                      top: 16,
                      bottom: 16,
                    ),
                    text: 'Round Trip',
                    icon: AppIcons.arrowPathIcon,
                    color: AppColors.blue50Color,
                    textColor: AppColors.blue700Color,
                  ),
                  TripTypeContainerWidget(
                    margin: EdgeInsets.only(right: 8, top: 16, bottom: 16),
                    text: 'Multi City',
                    icon: AppIcons.arrowPathRoundedSquareIcon,
                    color: AppColors.grey100Color,
                  ),
                  TripTypeContainerWidget(
                    margin: EdgeInsets.only(right: 8, top: 16, bottom: 16),
                    text: 'One Way',
                    icon: AppIcons.arrowLongLightIcon,
                    color: AppColors.grey100Color,
                  ),
                ],
              ),
            ),
            const LabelAndTextBoxWidget(
              label: 'Location',
              hint: 'Montreal,Canada',
            ),
            const LabelAndTextBoxWidget(
              hint: 'Tokyo,Japan',
              label: 'Destination',
            ),
            const Row(
              children: [
                Expanded(
                  child: LabelAndTextBoxWidget(
                    padding: EdgeInsets.only(
                      top: 6.0,
                      right: 4,
                      left: 16,
                      bottom: 16,
                    ),
                    hint: 'Dec 16th, 2025',
                    label: 'Departure',
                  ),
                ),
                Expanded(
                  child: LabelAndTextBoxWidget(
                    padding: EdgeInsets.only(
                      top: 6.0,
                      right: 16,
                      left: 4,
                      bottom: 16,
                    ),
                    labelPadding: EdgeInsets.only(right: 16, left: 7),
                    hint: 'Jan 6th,2025',
                    label: 'Return',
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Passenger',
                style: AppStyles.font14Meduim.copyWith(
                  color: AppColors.grey800Color,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0, right: 16, left: 16),
              child: PassengerComboBox(),
            ),
            CutomButtonFligthWidget(
              text: 'Search Flights',
              margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.selectFligthRouteName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
