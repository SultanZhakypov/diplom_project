import 'dart:convert';

import 'package:flutter/foundation.dart';

class HomeModel {
  final List<HomeModelTopics> topics;

  HomeModel({
    required this.topics,
  });

  HomeModel copyWith({
    List<HomeModelTopics>? topics,
  }) {
    return HomeModel(
      topics: topics ?? this.topics,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'topics': topics.map((x) => x.toMap()).toList()});

    return result;
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      topics: List<HomeModelTopics>.from(
          map['topics']?.map((x) => HomeModelTopics.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeModel.fromJson(String source) =>
      HomeModel.fromMap(json.decode(source));

  @override
  String toString() => 'HomeModel(topics: $topics)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeModel && listEquals(other.topics, topics);
  }

  @override
  int get hashCode => topics.hashCode;
}

class HomeModelTopics {
  final String id;
  final String category;
  final String content;
  final String title;
  HomeModelTopics({
    required this.id,
    required this.category,
    required this.content,
    required this.title,
  });

  HomeModelTopics copyWith({
    String? id,
    String? category,
    String? content,
    String? title,
  }) {
    return HomeModelTopics(
      id: id ?? this.id,
      category: category ?? this.category,
      content: content ?? this.content,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'category': category});
    result.addAll({'content': content});
    result.addAll({'title': title});

    return result;
  }

  factory HomeModelTopics.fromMap(Map<String, dynamic> map) {
    return HomeModelTopics(
      id: map['id'] ?? '',
      category: map['category'] ?? '',
      content: map['content'] ?? '',
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeModelTopics.fromJson(String source) =>
      HomeModelTopics.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HomeModelTopics(id: $id, category: $category, content: $content, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeModelTopics &&
        other.id == id &&
        other.category == category &&
        other.content == content &&
        other.title == title;
  }

  @override
  int get hashCode {
    return id.hashCode ^ category.hashCode ^ content.hashCode ^ title.hashCode;
  }
}
