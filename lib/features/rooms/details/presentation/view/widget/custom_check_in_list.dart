import 'package:flutter/material.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_check_in.dart';
import 'package:intl/intl.dart';

class CustomCheckINList extends StatefulWidget {
  const CustomCheckINList({required this.onChanged, super.key});
  final ValueChanged<String> onChanged;
  @override
  State<CustomCheckINList> createState() => _CustomCheckINListState();
}

class _CustomCheckINListState extends State<CustomCheckINList> {
  int currentIndex = -1;
  int daysCount = 30;
  List<DateTime> getDate() {
    final List<DateTime> dateList = [];
    for (int i = 0; i < daysCount; i++) {
      dateList.add(DateTime.now().add(Duration(days: i)));
    }
    return dateList;
  }

  @override
  Widget build(BuildContext context) {
    final DateList = getDate();
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .07,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: daysCount,
        itemBuilder: (context, index) {
          final day = DateFormat('E').format(DateList[index]);
          final date = DateFormat('d MMM').format(DateList[index]);
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  widget.onChanged(date);
                });
              },
              child: CustomCheckIN(
                isActive: currentIndex == index,
                date: date,
                day: day,
              ),
            ),
          );
        },
      ),
    );
  }
}
