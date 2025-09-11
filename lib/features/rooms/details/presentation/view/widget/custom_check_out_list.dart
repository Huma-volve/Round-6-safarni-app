import 'package:flutter/material.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_un_active_check_out.dart';

class CustomCheckOutList extends StatefulWidget {
  const CustomCheckOutList({super.key});

  @override
  State<CustomCheckOutList> createState() => _CustomCheckOutListState();
}

class _CustomCheckOutListState extends State<CustomCheckOutList> {
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
            child: CustomUnActiveCheckOut(isActive: currentIndex == index),
          ),
        ),
      ),
    );
  }
}
