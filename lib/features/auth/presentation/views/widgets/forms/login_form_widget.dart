import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/constants/cache_keys.dart';
import 'package:safarni/core/constants/routes_names.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/utils/auth_vaildators.dart';
import 'package:safarni/core/utils/cache_helper.dart';
import 'package:safarni/core/widgets/custom_button_widget.dart';
import 'package:safarni/core/widgets/dialogs/app_dialogs.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/auth/data/models/login_req_model.dart';
import 'package:safarni/features/auth/domain/use_cases/login.dart';
import 'package:safarni/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safarni/features/auth/presentation/views/widgets/auth_custom_text_form_flied.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/forget_password_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/have_an_account_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/or_divider_widget.dart';
import 'package:safarni/features/auth/presentation/views/widgets/social__buttons.dart';

class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({super.key});
  final _formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is AuthLoading) {
          AppDialogs.loadingDailog(context);
        }
        if (state is AuthFailure) {
          Navigator.pop(context);
          AppDialogs.showDialogError(
            context,
            'email or password is not correct ,please enter right info',
          );
        }
        if (state is Authsuccess) {
          Navigator.pop(context);
          // final user = await sl<CacheHelper>().getData('user');
          // print("sharedPrefernce ------------ ${jsonDecode(user!)['token']}");
          sl<CacheHelper>().saveData(CacheKeys.authorized, true.toString());
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.customButtomNavBar,
            (route) => true,
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.email, style: AppStyles.poppins14px500WGray800),
            const VerticalSpace(height: 4),
            AuthCustomTextFormFiled(
              controller: email,
              validator: AuthValidators.validateEmail,
            ),
            const VerticalSpace(height: 18),
            Text(AppStrings.password, style: AppStyles.poppins14px500WGray800),
            const VerticalSpace(height: 4),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is HidenPassword) {
                  obscureText = state.hidenPassword;
                }
                return AuthCustomTextFormFiled(
                  hintText: '*******',
                  prefixIcon: AppIcons.assetsImagesIconsLockIcon,
                  controller: password,
                  validator: AuthValidators.validatePassword,

                  obscureText: obscureText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onTap: () {
                    context.read<AuthCubit>().hidenPassword(obscureText);
                  },
                );
              },
            ),
            const VerticalSpace(height: 8),
            ForgetPasswordWidget(
              onTap: () {
                Navigator.of(context).pushNamed(RoutesNames.forgetPassword);
              },
            ),
            const VerticalSpace(height: 24),
            SizedBox(
              width: double.infinity,
              child: CustomButtonWidget(
                title: "Sign In",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthCubit>().excute(
                      usecase: sl<LoginUseCase>(),
                      params: LoginReqModel(
                        email: email.text,
                        password: password.text,
                      ),
                    );
                  }
                },
              ),
            ),
            const VerticalSpace(height: 24),
            const OrDividerWidget(),
            const VerticalSpace(height: 24),
            const SocialButtons(),
            const VerticalSpace(height: 36),
            HaveAnAccountWidget(
              tex1: AppStrings.dontHaveAnAccount,
              text2: AppStrings.signUp,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesNames.signUp,
                (route) => false,
              ),
            ),
            const VerticalSpace(height: 10),
          ],
        ),
      ),
    );
  }
}
