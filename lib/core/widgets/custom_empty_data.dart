import 'package:flutter/material.dart';
import 'package:safarni/core/model/empty_data_model.dart';

class CustomEmptyData extends StatelessWidget {
  const CustomEmptyData({required this.emptyDataModel, super.key});
  final EmptyDataModel emptyDataModel;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(emptyDataModel.icon, size: 60, color: Colors.grey.shade400),
          const SizedBox(height: 12),
          Text(
            emptyDataModel.title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            emptyDataModel.description,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}
