import 'package:collection/collection.dart';

class PostModels {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  const PostModels({this.userId, this.id, this.title, this.body});

  @override
  String toString() {
    return 'PostModels(userId: $userId, id: $id, title: $title, body: $body)';
  }

  factory PostModels.fromJson(Map<String, dynamic> json) => PostModels(
        userId: json['userId'] as int?,
        id: json['id'] as int?,
        title: json['title'] as String?,
        body: json['body'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };

  PostModels copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModels(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PostModels) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;
}
