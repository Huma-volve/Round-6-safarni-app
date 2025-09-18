import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/features/profile/domain/usecases/delete_account.dart';

abstract class DeleteAccountState {}

class DeleteAccountInitial extends DeleteAccountState {}

class DeleteAccountLoading extends DeleteAccountState {}

class DeleteAccountSuccess extends DeleteAccountState {}

class DeleteAccountFailure extends DeleteAccountState {}

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final DeleteAccountUseCase deleteAccountUseCase;

  DeleteAccountCubit(this.deleteAccountUseCase) : super(DeleteAccountInitial());

    Future<void> deleteAccount() async {
    print("🔥 deleteAccount() called"); // Debug log
    emit(DeleteAccountLoading());
    try {
      await deleteAccountUseCase();
      print("✅ deleteAccount success"); // Debug log
      emit(DeleteAccountSuccess());
    } catch (e, s) {
      print("❌ deleteAccount failed: $e");
      print(s);
      emit(DeleteAccountFailure());
    }
  }

}
