// import 'package:flutter/material.dart';
// import 'package:safarni/core/constants/app_colors.dart';
// import 'package:safarni/core/constants/app_styles.dart';

// class PassengerSelector extends StatefulWidget {
//   @override
//   _PassengerSelectorState createState() => _PassengerSelectorState();
// }

// class _PassengerSelectorState extends State<PassengerSelector> {
//   final TextEditingController _controller = TextEditingController();
//   final List<String> _options = [
//     '1 Passenger',
//     '2 Passengers',
//     '3 Passengers',
//     '4 Passengers',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Autocomplete<String>(
//           optionsBuilder: (TextEditingValue textEditingValue) {
//             if (textEditingValue.text == '') {
//               return _options;
//             }
//             return _options.where((String option) {
//               return option.toLowerCase().contains(
//                 textEditingValue.text.toLowerCase(),
//               );
//             });
//           },
//           fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
//             _controller.text = controller.text;
//             return TextFormField(
//               controller: controller,
//               focusNode: focusNode,
//               decoration: InputDecoration(
//                 hintText: '1 Passenger',
//                 hintStyle: AppStyles.font15Regular.copyWith(
//                   color: AppColors.greyHintColor,
//                   fontSize: 13,
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(
//                     color: AppColors.bordergreyColor,
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(
//                     color: AppColors.bordergreyColor,
//                   ),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(
//                     color: AppColors.bordergreyColor,
//                   ),
//                 ),
//                 suffixIcon: const Icon(
//                   Icons.arrow_drop_down,
//                   color: Color(0xffAFAFAF),
//                 ),
//               ),
//             );
//           },
//           onSelected: (String selection) {
//             _controller.text = selection;
//           },
//         ),
//       ],
//     );
//   }
// }

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class PassengerComboBox extends StatelessWidget {
  const PassengerComboBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownSearch<String>(
          items: (filter, infiniteScrollProps) => [
            '1 Passenger',
            '2 Passengers',
            '3 Passengers',
            '4 Passengers',
          ],
          popupProps: const PopupProps.menu(
            showSearchBox: true,
            menuProps: MenuProps(backgroundColor: AppColors.white),
          ),
          decoratorProps: DropDownDecoratorProps(
            decoration: InputDecoration(
              hintText: '1 Passenger',
              hintStyle: AppStyles.font15Regular.copyWith(
                color: AppColors.greyHintColor,
                fontSize: 13,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.bordergreyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.bordergreyColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.bordergreyColor),
              ),
            ),
          ),
          suffixProps: const DropdownSuffixProps(
            clearButtonProps: ClearButtonProps(
              icon: RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Color(0xffAFAFAF),
                  size: 18,
                ),
              ),
            ),
            dropdownButtonProps: DropdownButtonProps(
              iconClosed: RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Color(0xffAFAFAF),
                  size: 18,
                ),
              ),
            ),
          ),
          onChanged: (value) {},
        ),
      ],
    );
  }
}
