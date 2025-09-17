import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/constants/reg_expre_form.dart';
import 'package:safarni/core/useCases/usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;

  excute({required UseCase usecase, dynamic params, String? token}) async {
    emit(AuthLoading());
    // await Future.delayed(const Duration(seconds: 2));
    try {
      final Either result = await usecase.call(param: params);
      result.fold(
        (error) {
          emit(AuthFailure(errorMessage: error));
        },
        (data) {
          emit(Authsuccess());
        },
      );
    } on Exception catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  hidenPassword(bool hidenPassword) {
    emit(HidenPassword(hidenPassword: !hidenPassword));
  }

  hidenConfirmPassword(bool hidenConfirmPassword) {
    emit(HidenConfirmPassword(hidenPassword: !hidenConfirmPassword));
  }

  ruleCorrect(String password) {
    hasSpecialCharacters = AppRegex.hasSpecialCharacter(password);
    hasMinLength = AppRegex.hasMinLength(password);
    emit(Rulecorrect());
  }
}
