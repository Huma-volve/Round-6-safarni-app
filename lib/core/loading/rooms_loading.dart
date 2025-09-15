import 'package:safarni/features/rooms/domain/entity/rooms_entity.dart';

RoomsEntity getRoomsDummy() {
  final RoomsEntity roomsEntity = RoomsEntity(
    id: 0,
    image: '',
    discount: '',
    price: '',
  );
  return roomsEntity;
}
