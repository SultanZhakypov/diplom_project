import 'package:freezed_annotation/freezed_annotation.dart';

part 'cources_model.freezed.dart';
part 'cources_model.g.dart';

@freezed
class Courses with _$Courses {
  const factory Courses({
    String? image,
    List<Tests>? tests,
    String? title,
    String? video,
    String? description,
  }) = _Courses;

  factory Courses.fromJson(Map<String, dynamic> json) =>
      _$CoursesFromJson(json);
}

@freezed
class Tests with _$Tests {
  const factory Tests({
    int? available,
    String? question,
    List<Variants>? variants,
  }) = _Tests;

  factory Tests.fromJson(Map<String, dynamic> json) => _$TestsFromJson(json);
}

@freezed
class Variants with _$Variants {
  const factory Variants({
    int? code,
    String? variant,
  }) = _Variants;

  factory Variants.fromJson(Map<String, dynamic> json) =>
      _$VariantsFromJson(json);
}
