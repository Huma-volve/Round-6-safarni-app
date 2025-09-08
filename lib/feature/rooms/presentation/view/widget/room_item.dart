import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_style.dart';
import 'package:safarni/core/constant/assets.dart';
import 'package:safarni/feature/rooms/details/presentation/view/details_view.dart';
import 'package:safarni/feature/rooms/presentation/view/widget/custom_night_pound.dart';

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
              Image.asset(Assets.imagesTest3, fit: BoxFit.cover),
              const SizedBox(height: 8),
              Text(
                'Room_1',
                style: AppStyle.textMedium16.copyWith(
                  color: AppColors.primaryColor,
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
