import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:safarni/core/constants/script_keys.dart';
import 'package:safarni/core/utils/stripe_api_services.dart';
import 'package:safarni/features/payment/data/models/ephlemer_key_model/ephlemer_key_model.dart';
import 'package:safarni/features/payment/data/models/init_payment_sheet_input_model.dart';
import 'package:safarni/features/payment/data/models/payment_intent_input_model.dart';
import 'package:safarni/features/payment/data/models/payment_intent_model/payment_intent_model.dart';

class StripeServices {
  final StripeApiServices apiServices = StripeApiServices();
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiServices.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ScriptKeys.secretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({
    required InitPaymentSheetInputModel initPaymentSheetInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clintSecret,
        customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKey,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: 'Safarni',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance
        .presentPaymentSheet(); //عملت تغير هنا علشان لو في ايرور يبقي مغروف ان هنا
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemelarKeyModel = await createEphemlerKey(
      customerId: paymentIntentInputModel.customerId,
    );
    var initPaymentInputSheetModel = InitPaymentSheetInputModel(
      clintSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKey: ephemelarKeyModel.secret!,
      id: paymentIntentModel.id!,
    );
    await initPaymentSheet(
      initPaymentSheetInputModel: initPaymentInputSheetModel,
    );
    await displayPaymentSheet();
  }

  Future<EphlemerKeyModel> createEphemlerKey({
    required String customerId,
  }) async {
    var response = await apiServices.post(
      body: {'customer': customerId},
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ScriptKeys.secretKey,
      headers: {
        'Authorization': 'Bearer ${ScriptKeys.secretKey}',
        'Stripe-Version': '2023-08-16',
      },
    );

    var ehpemeralKey = EphlemerKeyModel.fromJson(response.data);
    return ehpemeralKey;
  }
}
