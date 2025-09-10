import 'package:flutter/material.dart';
import 'package:safarni/core/widgets/custom_divider.dart';
import 'package:safarni/features/rooms/details/data/model/age_model.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_age_list_tile.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_button.dart';

class CustomContinueButton extends StatelessWidget {
  const CustomContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * .14,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0xFFD1D5DB),
            blurRadius: 20,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: CustomButton(
            title: 'Continue',
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.white,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomAgeListTile(
                          title: AgeModel.ageList[0].title,
                          subTitle: AgeModel.ageList[0].subTitle,
                        ),
                        const SizedBox(height: 16),
                        const CustomDivider(),
                        const SizedBox(height: 16),
                        CustomAgeListTile(
                          title: AgeModel.ageList[1].title,
                          subTitle: AgeModel.ageList[1].subTitle,
                        ),
                        const SizedBox(height: 16),
                        const CustomDivider(),
                        const SizedBox(height: 16),
                        CustomAgeListTile(
                          title: AgeModel.ageList[2].title,
                          subTitle: AgeModel.ageList[2].subTitle,
                        ),
                        const SizedBox(height: 16),
                        const CustomDivider(),
                        const SizedBox(height: 16),
                        CustomButton(
                          title: 'Check Out',
                          onPressed: () {},
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .05,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
