
class FavouriteModel {
  final int id;
  final String title;
  final String location;
  final String description;
  final String price;
  final String image;
  final int views;
  final double rating;


  FavouriteModel({
    required this.id,
    required this.title,
    required this.location,
    required this.description,
    required this.price,
    required this.image,
    required this.views,
    required this.rating,

  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      id: json['id'],
      title: json['title'],
      location: json['location'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      views: json['views'],
      rating: (json['rating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'location': location,
      'description': description,
      'price': price,
      'image': image,
      'views': views,
      'rating': rating,

    };
  }

}
