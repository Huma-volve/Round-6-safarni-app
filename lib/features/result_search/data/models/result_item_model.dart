class ResultItemModel {
  final int id;
  final String title;
  final String location;
  final String description;
  final String price;
  final String image;
  final int views;
  final bool isRecommended;
  final bool isFavorite;
  final double rating;

  ResultItemModel({
    required this.id,
    required this.title,
    required this.location,
    required this.description,
    required this.price,
    required this.image,
    required this.views,
    required this.isRecommended,
    required this.isFavorite,
    required this.rating,
  });

  factory ResultItemModel.fromJson(Map<String, dynamic> json) {
    return ResultItemModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      location: json['location'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '0.0',
      image: json['image'] ?? '',
      views: json['views'] ?? 0,
      isRecommended: json['is_recommended'] ?? false,
      isFavorite: json['is_favorite'] ?? false,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "location": location,
      "description": description,
      "price": price,
      "image": image,
      "views": views,
      "is_recommended": isRecommended,
      "is_favorite": isFavorite,
      "rating": rating,
    };
  }
}
