import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/widgets/spacing/horizontal_space.dart';

class AppDialogs {
  static loadingDailog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const AlertDialog(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            HorizontalSpace(width: 16),
            Text('Loading'),
          ],
        ),
      ),
    );
  }

  static showDialogError(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error title", style: TextStyle(color: Colors.red)),
          content: Text(error, style: TextStyle(fontSize: 16.sp)),
        );
      },
    );
  }
}
