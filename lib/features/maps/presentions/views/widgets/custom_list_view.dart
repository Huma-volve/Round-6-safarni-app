import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListViewMap extends StatelessWidget {
  const CustomListViewMap({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(
                  CupertinoIcons.home,
                  size: 15,
                  color: CupertinoColors.black,
                ),
                SizedBox(width: 8),
                Text("Set Home", style: TextStyle(fontSize: 14)),
              ],
            ),
          );
        },
      ),
    );
  }
}
