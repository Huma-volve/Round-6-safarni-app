import 'package:equatable/equatable.dart';

class MyRoomBookingModel extends Equatable {
  final int? roomId;
  final String? checkInDate;
  final String? checkOutDate;
  final int? adultsCount;
  final int? childrenCount;
  final int? infantsCount;

  const MyRoomBookingModel({
    this.roomId,
    this.checkInDate,
    this.checkOutDate,
    this.adultsCount,
    this.childrenCount,
    this.infantsCount,
  });

  factory MyRoomBookingModel.fromJson(Map<String, dynamic> json) {
    return MyRoomBookingModel(
      roomId: json['room_id'] as int?,
      checkInDate: json['check_in_date'] as String?,
      checkOutDate: json['check_out_date'] as String?,
      adultsCount: json['adults_count'] as int?,
      childrenCount: json['children_count'] as int?,
      infantsCount: json['infants_count'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'room_id': roomId,
    'check_in_date': checkInDate,
    'check_out_date': checkOutDate,
    'adults_count': adultsCount,
    'children_count': childrenCount,
    'infants_count': infantsCount,
  };

  factory MyRoomBookingModel.fromEntity(myRoomBookingEntity) {
    return MyRoomBookingModel(
      roomId: myRoomBookingEntity.roomId,
      checkInDate: myRoomBookingEntity.checkInDate,
      checkOutDate: myRoomBookingEntity.checkOutDate,
      adultsCount: myRoomBookingEntity.adultsCount,
      childrenCount: myRoomBookingEntity.childrenCount,
      infantsCount: myRoomBookingEntity.infantsCount,
    );
  }

  @override
  List<Object?> get props {
    return [
      roomId,
      checkInDate,
      checkOutDate,
      adultsCount,
      childrenCount,
      infantsCount,
    ];
  }
}
