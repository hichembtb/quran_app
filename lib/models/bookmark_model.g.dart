// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookMarkAdapter extends TypeAdapter<BookMark> {
  @override
  final int typeId = 0;

  @override
  BookMark read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookMark(
      surahIndex: fields[0] as int?,
      pdfUrl: fields[1] as String?,
      pdfDefaultPage: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BookMark obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.surahIndex)
      ..writeByte(1)
      ..write(obj.pdfUrl)
      ..writeByte(2)
      ..write(obj.pdfDefaultPage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookMarkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
