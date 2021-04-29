import 'dart:convert';

class AwnserModel {
  final String title;
  final bool isRght;
  AwnserModel({
    required this.title,
    this.isRght = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isRght': isRght,
    };
  }

  factory AwnserModel.fromMap(Map<String, dynamic> map) {
    return AwnserModel(
      title: map['title'],
      isRght: map['isRght'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AwnserModel.fromJson(String source) =>
      AwnserModel.fromMap(json.decode(source));
}
