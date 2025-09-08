import 'package:flutter/material.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/active_tab.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/un_active_tab.dart';

class ActiveAndUnActiveTab extends StatelessWidget {
  const ActiveAndUnActiveTab({
    required this.text,
    required this.isActive,
    super.key,
  });
  final String text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState: isActive
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: ActiveTab(text: text),
      secondChild: UnActiveTab(text: text),
      duration: const Duration(milliseconds: 300),
    );
  }
}
