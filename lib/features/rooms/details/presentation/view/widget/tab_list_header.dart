import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_size.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/active_and_un_active_tab.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_animated_divider.dart';

class TapListHeader extends StatefulWidget {
  const TapListHeader({required this.pageController, super.key});

  final PageController pageController;

  @override
  State<TapListHeader> createState() => _TapListHeaderState();
}

class _TapListHeaderState extends State<TapListHeader> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: tabList.asMap().entries.map((e) {
              final int index = e.key;
              final String value = e.value;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    widget.pageController.jumpToPage(index);
                  });
                },
                child: ActiveAndUnActiveTab(
                  text: value,
                  isActive: currentIndex == index,
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 8),
        CustomAnimatedDivider(currentIndex: currentIndex),
      ],
    );
  }
}

List<String> tabList = ['About', 'Gallery', 'Review'];
