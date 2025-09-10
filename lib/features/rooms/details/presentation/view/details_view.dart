import 'package:flutter/material.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});
  static const String routeName = 'details_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: DetailsViewBody(),
    );
  }
}
