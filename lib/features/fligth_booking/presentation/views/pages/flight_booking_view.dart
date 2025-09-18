import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/custom_button_flight_widget.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/fligth_image_widget.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/label_and_textbox_widget.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/passenger_selector_widget.dart';
import 'package:safarni/features/fligth_booking/presentation/views/widgets/trip_type_container_widget.dart';

class FligthBookingView extends StatefulWidget {
  const FligthBookingView({super.key});

  @override
  State<FligthBookingView> createState() => _FligthBookingViewState();
}

class _FligthBookingViewState extends State<FligthBookingView> {
  final TextEditingController _departureController = TextEditingController();
  final TextEditingController _returnController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  DateTime? departureDate;
  DateTime? returnDate;

  String _formatDate(DateTime date) {
    final monthDay = DateFormat('MMM d').format(date);
    final year = DateFormat('yyyy').format(date);

    String daySuffix(int day) {
      if (day >= 11 && day <= 13) return 'th';
      switch (day % 10) {
        case 1:
          return "st";
        case 2:
          return "nd";
        case 3:
          return "rd";
        default:
          return "th";
      }
    }

    return '$monthDay${daySuffix(date.day)}, $year';
  }

  Future<void> selectDate({
    required BuildContext context,
    required bool isDeparture,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isDeparture
          ? (departureDate ?? DateTime.now())
          : (returnDate ?? departureDate ?? DateTime.now()),
      firstDate: isDeparture
          ? DateTime.now()
          : (departureDate ?? DateTime.now()),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isDeparture) {
          departureDate = picked;
          _departureController.text = _formatDate(picked);

          if (returnDate != null && returnDate!.isBefore(departureDate!)) {
            returnDate = null;
            _returnController.clear();
          }
        } else {
          returnDate = picked;
          _returnController.text = _formatDate(picked);
        }
      });
    }
  }

  String selectedType = 'Round Trip';

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
                children: [
                  TripTypeContainerWidget(
                    margin: const EdgeInsets.only(
                      left: 16,
                      right: 8,
                      top: 16,
                      bottom: 16,
                    ),
                    text: 'Round Trip',
                    icon: AppIcons.arrowPathIcon,
                    isSelected: selectedType == 'Round Trip',
                    onTap: () {
                      setState(() {
                        selectedType = 'Round Trip';
                      });
                    },
                  ),
                  TripTypeContainerWidget(
                    margin: const EdgeInsets.only(
                      right: 8,
                      top: 16,
                      bottom: 16,
                    ),
                    text: 'Multi City',
                    icon: AppIcons.arrowPathRoundedSquareIcon,
                    onTap: () {
                      setState(() {
                        selectedType = 'Multi City';
                      });
                    },
                    isSelected: selectedType == 'Multi City',
                  ),
                  TripTypeContainerWidget(
                    margin: const EdgeInsets.only(
                      right: 8,
                      top: 16,
                      bottom: 16,
                    ),
                    text: 'One Way',
                    icon: AppIcons.arrowLongLightIcon,
                    isSelected: selectedType == 'One Way',
                    onTap: () {
                      setState(() {
                        selectedType = 'One Way';
                      });
                    },
                  ),
                ],
              ),
            ),
            LabelAndTextBoxWidget(
              controller: _fromController,
              label: 'Location',
              hint: 'Montreal,Canada',
            ),
            LabelAndTextBoxWidget(
              controller: _toController,
              hint: 'Tokyo,Japan',
              label: 'Destination',
            ),
            Row(
              children: [
                Expanded(
                  child: LabelAndTextBoxWidget(
                    controller: _departureController,
                    onTap: () =>
                        selectDate(context: context, isDeparture: true),
                    readOnly: true,
                    padding: const EdgeInsets.only(
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
                    onTap: () =>
                        selectDate(context: context, isDeparture: false),
                    controller: _returnController,
                    readOnly: true,
                    padding: const EdgeInsets.only(
                      top: 6.0,
                      right: 16,
                      left: 4,
                      bottom: 16,
                    ),
                    labelPadding: const EdgeInsets.only(right: 16, left: 7),
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
            const Padding(
              padding: EdgeInsets.only(top: 6.0, right: 16, left: 16),
              child: PassengerComboBox(),
            ),

            CutomButtonFligthWidget(
              text: 'Search Flights',
              margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              onTap: () async {
                final from = _fromController.text;
                final to = _toController.text;
                final date = departureDate != null
                    ? DateFormat('yyyy-MM-dd').format(departureDate!)
                    : '';

                if (from.isNotEmpty && to.isNotEmpty && date.isNotEmpty) {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.selectFligthRouteName,
                    arguments: {'from': from, 'to': to, 'date': date},
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter all fields')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
