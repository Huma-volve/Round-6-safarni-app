import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/routes_names.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/utils/auth_vaildators.dart';
import 'package:safarni/core/widgets/custom_button_widget.dart';
import 'package:safarni/core/widgets/dialogs/app_dialogs.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/auth/data/models/set_new_password_req_password.dart';
import 'package:safarni/features/auth/domain/use_cases/set_new_password.dart';
import 'package:safarni/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safarni/features/auth/presentation/views/widgets/auth_custom_text_form_flied.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/back_to_login_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/name_text_filed.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/required_rules_widget.dart';

class SetNewPasswordFormWidget extends StatefulWidget {
  SetNewPasswordFormWidget({super.key});

  @override
  State<SetNewPasswordFormWidget> createState() =>
      _SetNewPasswordFormWidgetState();
}

class _SetNewPasswordFormWidgetState extends State<SetNewPasswordFormWidget> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController password;

  final TextEditingController confirmPassword = TextEditingController();
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;
  bool obscureText = true;
  bool obscureText2 = true;
  @override
  void initState() {
    password = TextEditingController();
    setupPasswordControllerListener();
    super.initState();
  }

  void setupPasswordControllerListener() {
    password.addListener(() {
      context.read<AuthCubit>().ruleCorrect(password.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          AppDialogs.loadingDailog(context);
        }
        if (state is Authsuccess) {
          Navigator.pop(context);
          Navigator.pushNamed(context, RoutesNames.passwordResetView);
        }
        if (state is AuthFailure) {
          Navigator.pop(context);
          AppDialogs.showDialogError(context, state.errorMessage);
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesNames.login,
            (route) => false,
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpace(height: 6),
            NameTextFormFiled(name: AppStrings.password),
            const VerticalSpace(height: 4),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is HidenPassword) {
                  obscureText = state.hidenPassword;
                }
                return AuthCustomTextFormFiled(
                  controller: password,
                  hintText: '*******',
                  obscureText: obscureText,
                  prefixIcon: AppIcons.assetsImagesIconsLockIcon,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onTap: () {
                    context.read<AuthCubit>().hidenPassword(obscureText);
                  },
                );
              },
            ),
            const VerticalSpace(height: 16),
            NameTextFormFiled(name: AppStrings.confirmPassword),
            const VerticalSpace(height: 4),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is HidenConfirmPassword) {
                  obscureText2 = state.hidenPassword;
                }
                return AuthCustomTextFormFiled(
                  hintText: '*******',
                  obscureText: obscureText2,
                  prefixIcon: AppIcons.assetsImagesIconsLockIcon,
                  controller: confirmPassword,
                  validator: (comfirmPassword) {
                    return AuthValidators.validateConfirmPassword(
                      password.text,
                      comfirmPassword,
                    );
                  },
                  onTap: () {
                    context.read<AuthCubit>().hidenConfirmPassword(
                      obscureText2,
                    );
                  },
                );
              },
            ),
            const VerticalSpace(height: 42),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return RequiredRulesWidget(
                  hasMinLength: context.read<AuthCubit>().hasMinLength,
                  hasSpecialCharacters: context
                      .read<AuthCubit>()
                      .hasSpecialCharacters,
                );
              },
            ),
            const VerticalSpace(height: 6),
            SizedBox(
              width: double.infinity,
              child: CustomButtonWidget(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthCubit>().excute(
                      usecase: sl<SetNewPasswordUseCase>(),
                      params: SetNewPasswordReqPasswordModel(
                        password: password.text,
                        confirmPassword: confirmPassword.text,
                      ),
                    );
                  }
                },
                title: AppStrings.resetPassword,
              ),
            ),
            const VerticalSpace(height: 24),
            BackToLoginWidget(
              onTap: () => Navigator.of(
                context,
              ).pushNamedAndRemoveUntil(RoutesNames.login, (route) => false),
            ),
          ],
        ),
      ),
    );
  }
}
