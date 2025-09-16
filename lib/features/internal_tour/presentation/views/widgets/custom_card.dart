import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/internal_tour/domain/entites/internal_entity.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.tour});
  final Tour tour;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            tour.image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          "${tour.rating}",
          style: AppStyles.priceTourStyle.copyWith(color: AppColors.black),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tour.title,
              style: AppStyles.priceTourStyle.copyWith(color: AppColors.black),
            ),
            Text(
              "From ${tour.price}\$ per person",
              style: AppStyles.priceTourStyle,
            ),
          ],
        ),
        isThreeLine: true,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, color: AppColors.yellowColor, size: 20),
            Text(tour.rating.toString()),
          ],
        ),
      ),
    );
    ;
  }
}
