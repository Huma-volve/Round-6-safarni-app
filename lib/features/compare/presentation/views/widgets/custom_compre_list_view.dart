import 'package:flutter/material.dart';
import 'package:safarni/features/compare/presentation/views/widgets/custom_compre_item.dart';

class CustomCompreListView extends StatelessWidget {
  const CustomCompreListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const CustomCompreItem(),
        childCount: 5,
      ),
    );
  }
}
