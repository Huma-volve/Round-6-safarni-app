import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/features/payment/domain/usecases/payment_usecase.dart';
import 'package:safarni/features/payment/presentation/cubit/checkout/checkout_state.dart';

class CheckoutCubit extends Cubit<CheckOutState> {
  final PaymentUseCase paymentUseCase;

  CheckoutCubit(this.paymentUseCase) : super(CheckoutInitial());

  Future<void> makePayment(int bookingId, String bookingType) async {
    emit(CheckoutLoading());
    try {
      final payment = await paymentUseCase.call(bookingId, bookingType);
      emit(CheckoutSuccess(payment));
    } catch (e) {
      emit(CheckoutFailure(e.toString()));
    }
  }
}
