import 'package:flutter/material.dart';
import 'package:safarni/feature/rooms/presentation/view/widget/room_item.dart';

class RoomsItemList extends StatelessWidget {
  const RoomsItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const RoomsItem(),
        childCount: 10,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
    );
  }
}
