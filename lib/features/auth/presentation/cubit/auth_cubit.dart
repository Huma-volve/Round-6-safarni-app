import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/useCases/usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  excute({dynamic params, required UseCase usecase}) async {
    emit(AuthLoading());
    // await Future.delayed(const Duration(seconds: 2));
    try {
      Either result = await usecase.call(param: params);
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
}
