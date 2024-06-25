// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cources_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoursesImpl _$$CoursesImplFromJson(Map<String, dynamic> json) =>
    _$CoursesImpl(
      image: json['image'] as String?,
      tests: (json['tests'] as List<dynamic>?)
          ?.map((e) => Tests.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      video: json['video'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$CoursesImplToJson(_$CoursesImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'tests': instance.tests,
      'title': instance.title,
      'video': instance.video,
      'description': instance.description,
    };

_$TestsImpl _$$TestsImplFromJson(Map<String, dynamic> json) => _$TestsImpl(
      available: (json['available'] as num?)?.toInt(),
      question: json['question'] as String?,
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => Variants.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TestsImplToJson(_$TestsImpl instance) =>
    <String, dynamic>{
      'available': instance.available,
      'question': instance.question,
      'variants': instance.variants,
    };

_$VariantsImpl _$$VariantsImplFromJson(Map<String, dynamic> json) =>
    _$VariantsImpl(
      code: (json['code'] as num?)?.toInt(),
      variant: json['variant'] as String?,
    );

Map<String, dynamic> _$$VariantsImplToJson(_$VariantsImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'variant': instance.variant,
    };
