import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_strings.dart';
import 'package:safarni/core/constant/app_style.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/auth/presentation/views/widgets/auth_custom_text_form_flied.dart';
import 'package:safarni/features/auth/presentation/views/widgets/forms/sign_up_form_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/name_text_filed.dart';

class ForgetFormWidget extends StatelessWidget {
  ForgetFormWidget({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameTextFormFiled(name: AppStrings.email),
          VerticalSpace(height: 4),
          AuthCustomTextFormFiled(),
        ],
      ),
    );
  }
}
