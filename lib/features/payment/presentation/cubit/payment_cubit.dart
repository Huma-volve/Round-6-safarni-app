import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:safarni/features/payment/data/models/payment_intent_input_model.dart';
import 'package:safarni/features/payment/domain/repository/checkout_base_repository.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutBaseRepository) : super(PaymentInitial());

  final CheckoutBaseRepository checkoutBaseRepository;

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymentLoading());
    var data = await checkoutBaseRepository.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );

    data.fold(
      (l) => emit(PaymentError(errorMessage: l.message)),
      (r) => emit(PaymentSuccess()),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
