// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GalleryEntityAdapter extends TypeAdapter<GalleryEntity> {
  @override
  final int typeId = 1;

  @override
  GalleryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GalleryEntity(
      image: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GalleryEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GalleryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
