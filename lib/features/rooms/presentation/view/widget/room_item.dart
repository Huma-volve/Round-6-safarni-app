import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/rooms/details/presentation/view/details_view.dart';
import 'package:safarni/features/rooms/presentation/view/widget/custom_night_pound.dart';

class RoomsItem extends StatelessWidget {
  const RoomsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsView.routeName);
      },
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: const [BoxShadow(color: Color(0x3F6F6F6F), blurRadius: 20)],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .13,
                width: double.infinity,
                child: Image.asset(AppImages.imagesTest3, fit: BoxFit.cover),
              ),
              const SizedBox(height: 8),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Room_1',
                  style: AppStyles.textMedium16(
                    context: context,
                  ).copyWith(color: AppColors.primaryColor),
                ),
              ),
              const SizedBox(height: 8),
              const Expanded(child: CustomNightPound()),
            ],
          ),
        ),
      ),
    );
  }
}
