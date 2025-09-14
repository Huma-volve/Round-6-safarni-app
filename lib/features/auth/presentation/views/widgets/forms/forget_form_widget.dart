import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/routes_names.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/utils/auth_vaildators.dart';
import 'package:safarni/core/widgets/custom_button_widget.dart';
import 'package:safarni/core/widgets/dialogs/app_dialogs.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/auth/domain/use_cases/forget_password.dart';
import 'package:safarni/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safarni/features/auth/presentation/views/widgets/auth_custom_text_form_flied.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/name_text_filed.dart';

class ForgetFormWidget extends StatelessWidget {
  ForgetFormWidget({super.key});
  final _formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  late String emailTex;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          AppDialogs.loadingDailog(context);
        }
        if (state is Authsuccess) {
          Navigator.pop(context);
          print("EMAIL VALUE: ${email.text}");

          Navigator.pushNamed(
            context,
            RoutesNames.checkOtp,
            arguments: email.text,
          );
        }
        if (state is AuthFailure) {
          Navigator.pop(context);
          AppDialogs.showDialogError(context, 'Error , try later');
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NameTextFormFiled(name: AppStrings.email),
            const VerticalSpace(height: 4),
            AuthCustomTextFormFiled(
              controller: email,
              validator: AuthValidators.validateEmail,
            ),
            const VerticalSpace(height: 16),
            SizedBox(
              width: double.infinity,
              child: CustomButtonWidget(
                onPressed: () async {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const CheckYourEmailView(),
                  //   ),
                  // );
                  // await ForgetPasswordUseCse().call(param: email.text);
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthCubit>().excute(
                      usecase: sl<ForgetPasswordUseCse>(),
                      params: email.text,
                    );
                  }
                },
                title: AppStrings.resetPassword,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
