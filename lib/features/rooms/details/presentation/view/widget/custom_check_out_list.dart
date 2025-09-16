import 'package:flutter/material.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_check_out.dart';
import 'package:intl/intl.dart';

class CustomCheckOutList extends StatefulWidget {
  const CustomCheckOutList({required this.onChanged, super.key});
  final ValueChanged<String> onChanged;
  @override
  State<CustomCheckOutList> createState() => _CustomCheckOutListState();
}

class _CustomCheckOutListState extends State<CustomCheckOutList> {
  int currentIndex = -1;
  int daysCount = 30;
  List<DateTime> dataTimeList() {
    final List<DateTime> dateList = [];
    for (int i = 0; i < daysCount; i++) {
      dateList.add(DateTime.now().add(Duration(days: i)));
    }
    return dateList;
  }

  @override
  Widget build(BuildContext context) {
    final dates = dataTimeList();

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .07,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemBuilder: (context, index) {
          final day = DateFormat('E').format(dates[index]);
          final date = DateFormat('d MMM').format(dates[index]);
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                  widget.onChanged(date);
                });
              },
              child: CustomCheckOut(
                isActive: currentIndex == index,
                date: date.toString(),
                day: day.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
