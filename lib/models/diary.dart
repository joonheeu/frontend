import 'package:json_annotation/json_annotation.dart';

part 'diary.g.dart';

@JsonSerializable()
class Diary {
  final int id;
  final String title;
  final String content;
  final DateTime writeDate;
  final DateTime createdAt;

  Diary({
    required this.id,
    required this.title,
    required this.content,
    required this.writeDate,
    required this.createdAt,
  });

  factory Diary.fromJson(Map<String, dynamic> json) => _$DiaryFromJson(json);

  Map<String, dynamic> toJson() => _$DiaryToJson(this);
}
