class InitPaymentSheetInputModel {
  final String clintSecret;
  final String customerId;
  final String ephemeralKey;

  InitPaymentSheetInputModel({
    required this.clintSecret,
    required this.customerId,
    required this.ephemeralKey,
  });
}
