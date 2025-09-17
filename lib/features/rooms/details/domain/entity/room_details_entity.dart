class RoomDetailsEntity {
  final int id;
  final String description;
  final String price;

  final String bathroomNumber;
  final String capacity;
  final String area;
  final String image;
  final String discount;
  final String averageRating;
  final String totalReviews;

  RoomDetailsEntity({
    required this.bathroomNumber,

    required this.area,
    required this.capacity,

    required this.id,
    required this.description,
    required this.price,
    required this.image,
    required this.discount,
    required this.averageRating,
    required this.totalReviews,
  });
}
