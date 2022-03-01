import 'dart:convert';

class TodolistModel {
  TodolistModel({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.isVisited,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String image;
  final String title;
  final String description;
  final bool isVisited;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'image': image,
      'title': title,
      'description': description,
      'isVisited': isVisited,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory TodolistModel.fromMap(Map<String, dynamic> map) {
    return TodolistModel(
      id: map['_id'] ?? '',
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isVisited: map['isVisited'] ?? false,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TodolistModel.fromJson(String source) => TodolistModel.fromMap(json.decode(source));
}
