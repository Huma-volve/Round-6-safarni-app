import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/reg_expre_form.dart';
import 'package:safarni/core/constants/routes_names.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/utils/auth_vaildators.dart';
import 'package:safarni/core/widgets/custom_button_widget.dart';
import 'package:safarni/core/widgets/dialogs/app_dialogs.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/auth/data/models/register_req_model.dart';
import 'package:safarni/features/auth/domain/use_cases/register.dart';
import 'package:safarni/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safarni/features/auth/presentation/views/widgets/auth_custom_text_form_flied.dart';
import 'package:safarni/features/auth/presentation/views/widgets/custom_button_with_icon.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/have_an_account_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/name_text_filed.dart';
import 'package:safarni/features/auth/presentation/views/widgets/or_divider_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/required_rules_widget.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final _formKey = GlobalKey<FormState>();

  var name = TextEditingController();

  var email = TextEditingController();

  TextEditingController? password;

  String? iconPath;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;

  bool obscureText = false;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    password = TextEditingController();
    super.initState();
  }

  void setupPasswordControllerListener() {
    password!.addListener(() {
      setState(() {
        // hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        // hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(password!.text);
        // hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(password!.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          AppDialogs.loadingDailog(context);
        }
        if (state is AuthFailure) {
          Navigator.pop(context);
          // var snackBar = SnackBar(content: Text(state.errorMessage));
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          AppDialogs.showDialogError(context, state.errorMessage);
        }
        if (state is Authsuccess) {
          Navigator.pop(context);
          Navigator.pushNamed(context, AppRoutes.homeScreen);
        }
      },
      child: Form(
        autovalidateMode: autovalidateMode,
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NameTextFormFiled(name: AppStrings.name),
            const VerticalSpace(height: 4),
            AuthCustomTextFormFiled(
              prefixIcon: AppIcons.assetsImagesIconsPersonIcon,
              controller: name,
              validator: AuthValidators.validateUsername,
            ),
            const VerticalSpace(height: 16),
            NameTextFormFiled(name: AppStrings.email),
            const VerticalSpace(height: 4),
            AuthCustomTextFormFiled(
              controller: email,
              validator: AuthValidators.validateEmail,
            ),
            const VerticalSpace(height: 16),
            NameTextFormFiled(name: AppStrings.password),
            const VerticalSpace(height: 4),
            AuthCustomTextFormFiled(
              hintText: '*******',
              prefixIcon: AppIcons.assetsImagesIconsLockIcon,
              controller: password,
              validator: AuthValidators.validatePassword,
              obscureText: true,
            ),
            const VerticalSpace(height: 16),
            RequiredRulesWidget(
              hasMinLength: hasMinLength,
              hasSpecialCharacters: hasSpecialCharacters,
            ),
            const VerticalSpace(height: 24),
            SizedBox(
              width: double.infinity,
              child: CustomButtonWidget(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthCubit>().excute(
                      usecase: sl<RegisterUseCase>(),
                      params: RegisterReqModel(
                        name: name.text,
                        email: email.text,
                        password: password!.text,
                      ),
                    );
                  }
                },
              ),
            ),
            const VerticalSpace(height: 24),
            const OrDividerWidget(),
            const VerticalSpace(height: 24),
            CustomButtonWithIcon(
              onPressed: () {},
              icon: AppIcons.assetsImagesIconsGoogleIcon,
              title: AppStrings.signUpWithGoogle,
            ),
            const VerticalSpace(height: 12),
            CustomButtonWithIcon(
              onPressed: () {},
              icon: AppIcons.assetsImagesIconsFacebookIcon,
              title: AppStrings.signUpWithFacebook,
            ),
            const VerticalSpace(height: 12),
            CustomButtonWithIcon(
              onPressed: () {},
              icon: AppIcons.assetsImagesIconsAppleIcon,
              title: AppStrings.signUpWithApple,
            ),
            const VerticalSpace(height: 36),
            HaveAnAccountWidget(
              tex1: AppStrings.alreadyHaveAnAccount,
              text2: AppStrings.signIn,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesNames.login,
                (route) => true,
              ),
            ),
            const VerticalSpace(height: 10),
          ],
        ),
      ),
    );
  }
}
