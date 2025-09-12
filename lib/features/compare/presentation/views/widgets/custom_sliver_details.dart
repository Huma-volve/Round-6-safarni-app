import 'package:flutter/material.dart';
import 'package:safarni/features/compare/presentation/views/widgets/custom_details_container.dart';

class CustomSliverDetails extends StatelessWidget {
  final int? selectedIndex;
  final ValueChanged<int> onSelect;

  const CustomSliverDetails({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        bool isSelected = selectedIndex == index;

        return CustomDetailsContainer(
          isSelected: isSelected,
          onTap: () => onSelect(index),
        );
      }, childCount: 5),
    );
  }
}
