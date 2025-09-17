import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/internal_tour/domain/entites/internal_entity.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.tour, super.key});
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
          child: Image.network(
            tour.image,
            width: 60,
            height: 60,
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.broken_image,
                size: 60,
                color: Colors.grey,
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
        title: Text(
          tour.title,
          style: AppStyles.priceTourStyle.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From ${tour.price}\$ per person',
              style: AppStyles.priceTourStyle.copyWith(
                color: AppColors.viewAllColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
        isThreeLine: true,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, color: AppColors.yellowColor, size: 20),
            Text(
              tour.rating.toString(),
              style: AppStyles.priceTourStyle.copyWith(color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
