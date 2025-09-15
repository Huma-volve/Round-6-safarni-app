class MyRoomBookingEntity {
  final int? roomId;
  final String? checkInDate;
  final String? checkOutDate;
  final int? adultsCount;
  final int? childrenCount;
  final int? infantsCount;

  MyRoomBookingEntity({
    required this.roomId,
    required this.checkInDate,
    required this.checkOutDate,
    required this.adultsCount,
    required this.childrenCount,
    required this.infantsCount,
  });
}
