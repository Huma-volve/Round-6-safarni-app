import 'package:flutter/material.dart';

Widget buildExtraBox(int count, {required BuildContext context}) {
  return Container(
    width: MediaQuery.sizeOf(context).width * .15,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white, width: 5),
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(6),
        bottomRight: Radius.circular(6),
      ),
    ),
    child: Center(
      child: Text(
        '+$count',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
