import 'package:dartz/dartz.dart';
import 'package:safarni/core/errors/failur.dart';
import 'package:safarni/core/utils/stripe_services.dart';

import 'package:safarni/features/payment/data/models/payment_intent_input_model.dart';
import 'package:safarni/features/payment/domain/repository/checkout_base_repository.dart';

class CheckoutRepository extends CheckoutBaseRepository {
  final StripeServices stripeServices = StripeServices();
  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeServices.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(errorMessage: 'Error : $e'));
    }
  }
}
