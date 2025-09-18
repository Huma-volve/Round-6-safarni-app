class ApiConstants {
  static const String baseUrl = 'http://round5-safarnia.huma-volve.com/api';
  static const int id = 10;
  // static const String destantion = '$baseUrl/tours/$id';
  static String destantion(int id) => '$baseUrl/tours/$id';
  static const String activities = '$baseUrl/top-rated-activities';
  static const int tourId = 1;
  // static const String reviwes = '$baseUrl/tours/$tourId/reviews';
  static String reviwes(int tourId) => '$baseUrl/tours/$tourId/reviews';
  static const String token =
      '336|vQe56bZD9CfYRQAauWDXjxIDXA9pBaoOop0udkmE8ffea59d';

  static String allseats(int fligthId) => '$baseUrl/flights/$fligthId';
  static const String bookAFlight = '$baseUrl/booking/flight';
  static const String allFlights = '$baseUrl/flights';
}
