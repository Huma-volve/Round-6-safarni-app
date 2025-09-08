import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class Tour {
  final String name;
  final String image;
  final double price;
  final double rating;
  final String type;

  Tour({
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.type,
  });
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.tour});
  final Tour tour;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.background,
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
        title: Text("${tour.type}", style: AppTextStyles.Interw700f14),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tour.name, style: AppTextStyles.Interw700f14),
            Text(
              "From ${tour.price}\$ per person",
              style: AppTextStyles.Interw700f14.copyWith(
                color: AppColors.lightBlue,
              ),
            ),
          ],
        ),
        isThreeLine: true,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, color: AppColors.amber, size: 20),
            Text(tour.rating.toString()),
          ],
        ),
      ),
    );
    ;
  }
}
