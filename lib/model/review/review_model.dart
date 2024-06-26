import 'package:dimplom/model/course/course_model.dart';
import 'package:dimplom/model/profile/user_model.dart';

import 'package:json_annotation/json_annotation.dart';
part 'review_model.g.dart';

@JsonSerializable()
class Review {
  int? id;
  double? rating;
  String? review;
  UserModel? user;
  CourseModel? course;

  Review({
    required this.id,
    this.user,
    this.course,
    this.rating,
    this.review,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
