class RecommendedTourModel {

  List<Data>? data;

  RecommendedTourModel({ this.data});

  RecommendedTourModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? location;
  String? description;
  String? price;
  String? image;
  int? views;
  bool? isRecommended;
  bool? isFavorite;
  double? rating;

  Data(
      {this.id,
        this.title,
        this.location,
        this.description,
        this.price,
        this.image,
        this.views,
        this.isRecommended,
        this.isFavorite,
        this.rating});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    location = json['location'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    views = json['views'];
    isRecommended = json['is_recommended'];
    isFavorite = json['is_favorite'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['location'] = this.location;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    data['views'] = this.views;
    data['is_recommended'] = this.isRecommended;
    data['is_favorite'] = this.isFavorite;
    data['rating'] = this.rating;
    return data;
  }
}
