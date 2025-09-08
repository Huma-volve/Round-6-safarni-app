import 'package:flutter/material.dart';
import 'package:safarni/core/helper/custom_app_bar.dart';
import 'package:safarni/feature/rooms/presentation/view/widget/rooms_view_body.dart';

class RoomsView extends StatelessWidget {
  const RoomsView({super.key});
  static const String routeName = 'rooms_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: customAppBar(), body: const RoomsViewBody());
  }
}
