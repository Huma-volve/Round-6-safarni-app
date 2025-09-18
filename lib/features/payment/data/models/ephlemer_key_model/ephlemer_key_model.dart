import 'associated_object.dart';

class EphlemerKeyModel {
  String? id;
  String? object;
  List<AssociatedObject>? associatedObjects;
  int? created;
  int? expires;
  bool? livemode;
  String? secret;

  EphlemerKeyModel({
    this.id,
    this.object,
    this.associatedObjects,
    this.created,
    this.expires,
    this.livemode,
    this.secret,
  });

  factory EphlemerKeyModel.fromJson(Map<String, dynamic> json) {
    return EphlemerKeyModel(
      id: json['id'] as String?,
      object: json['object'] as String?,
      associatedObjects: (json['associated_objects'] as List<dynamic>?)
          ?.map((e) => AssociatedObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: json['created'] as int?,
      expires: json['expires'] as int?,
      livemode: json['livemode'] as bool?,
      secret: json['secret'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'object': object,
    'associated_objects': associatedObjects?.map((e) => e.toJson()).toList(),
    'created': created,
    'expires': expires,
    'livemode': livemode,
    'secret': secret,
  };
}
