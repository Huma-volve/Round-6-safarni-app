import 'package:flutter/material.dart';

class EmptyDataModel {
  final String title;
  final String description;
  final IconData icon;

  EmptyDataModel({
    required this.title,
    required this.description,
    required this.icon,
  });
  static List<EmptyDataModel> list = [
    EmptyDataModel(
      title: 'No reviews yet',
      description: 'Be the first to add a review ✨',
      icon: Icons.rate_review_outlined,
    ),
    EmptyDataModel(
      title: 'No Images in Gallery yet',
      description: 'Be the first to add a image ✨',
      icon: Icons.image_outlined,
    ),
  ];
}
