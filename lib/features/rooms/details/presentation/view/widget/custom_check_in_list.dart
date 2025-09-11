import 'package:flutter/material.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_un_active_check_in.dart';

class CustomCheckINList extends StatefulWidget {
  const CustomCheckINList({super.key});

  @override
  State<CustomCheckINList> createState() => _CustomCheckINListState();
}

class _CustomCheckINListState extends State<CustomCheckINList> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .07,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: CustomUnActiveCheckIN(isActive: currentIndex == index),
          ),
        ),
      ),
    );
  }
}
