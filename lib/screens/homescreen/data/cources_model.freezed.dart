// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cources_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Courses _$CoursesFromJson(Map<String, dynamic> json) {
  return _Courses.fromJson(json);
}

/// @nodoc
mixin _$Courses {
  String? get image => throw _privateConstructorUsedError;
  List<Tests>? get tests => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get video => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoursesCopyWith<Courses> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoursesCopyWith<$Res> {
  factory $CoursesCopyWith(Courses value, $Res Function(Courses) then) =
      _$CoursesCopyWithImpl<$Res, Courses>;
  @useResult
  $Res call(
      {String? image,
      List<Tests>? tests,
      String? title,
      String? video,
      String? description});
}

/// @nodoc
class _$CoursesCopyWithImpl<$Res, $Val extends Courses>
    implements $CoursesCopyWith<$Res> {
  _$CoursesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? tests = freezed,
    Object? title = freezed,
    Object? video = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      tests: freezed == tests
          ? _value.tests
          : tests // ignore: cast_nullable_to_non_nullable
              as List<Tests>?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoursesImplCopyWith<$Res> implements $CoursesCopyWith<$Res> {
  factory _$$CoursesImplCopyWith(
          _$CoursesImpl value, $Res Function(_$CoursesImpl) then) =
      __$$CoursesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? image,
      List<Tests>? tests,
      String? title,
      String? video,
      String? description});
}

/// @nodoc
class __$$CoursesImplCopyWithImpl<$Res>
    extends _$CoursesCopyWithImpl<$Res, _$CoursesImpl>
    implements _$$CoursesImplCopyWith<$Res> {
  __$$CoursesImplCopyWithImpl(
      _$CoursesImpl _value, $Res Function(_$CoursesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? tests = freezed,
    Object? title = freezed,
    Object? video = freezed,
    Object? description = freezed,
  }) {
    return _then(_$CoursesImpl(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      tests: freezed == tests
          ? _value._tests
          : tests // ignore: cast_nullable_to_non_nullable
              as List<Tests>?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoursesImpl implements _Courses {
  const _$CoursesImpl(
      {this.image,
      final List<Tests>? tests,
      this.title,
      this.video,
      this.description})
      : _tests = tests;

  factory _$CoursesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoursesImplFromJson(json);

  @override
  final String? image;
  final List<Tests>? _tests;
  @override
  List<Tests>? get tests {
    final value = _tests;
    if (value == null) return null;
    if (_tests is EqualUnmodifiableListView) return _tests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? title;
  @override
  final String? video;
  @override
  final String? description;

  @override
  String toString() {
    return 'Courses(image: $image, tests: $tests, title: $title, video: $video, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoursesImpl &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._tests, _tests) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, image,
      const DeepCollectionEquality().hash(_tests), title, video, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoursesImplCopyWith<_$CoursesImpl> get copyWith =>
      __$$CoursesImplCopyWithImpl<_$CoursesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoursesImplToJson(
      this,
    );
  }
}

abstract class _Courses implements Courses {
  const factory _Courses(
      {final String? image,
      final List<Tests>? tests,
      final String? title,
      final String? video,
      final String? description}) = _$CoursesImpl;

  factory _Courses.fromJson(Map<String, dynamic> json) = _$CoursesImpl.fromJson;

  @override
  String? get image;
  @override
  List<Tests>? get tests;
  @override
  String? get title;
  @override
  String? get video;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$CoursesImplCopyWith<_$CoursesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Tests _$TestsFromJson(Map<String, dynamic> json) {
  return _Tests.fromJson(json);
}

/// @nodoc
mixin _$Tests {
  int? get available => throw _privateConstructorUsedError;
  String? get question => throw _privateConstructorUsedError;
  List<Variants>? get variants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestsCopyWith<Tests> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestsCopyWith<$Res> {
  factory $TestsCopyWith(Tests value, $Res Function(Tests) then) =
      _$TestsCopyWithImpl<$Res, Tests>;
  @useResult
  $Res call({int? available, String? question, List<Variants>? variants});
}

/// @nodoc
class _$TestsCopyWithImpl<$Res, $Val extends Tests>
    implements $TestsCopyWith<$Res> {
  _$TestsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = freezed,
    Object? question = freezed,
    Object? variants = freezed,
  }) {
    return _then(_value.copyWith(
      available: freezed == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      variants: freezed == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<Variants>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestsImplCopyWith<$Res> implements $TestsCopyWith<$Res> {
  factory _$$TestsImplCopyWith(
          _$TestsImpl value, $Res Function(_$TestsImpl) then) =
      __$$TestsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? available, String? question, List<Variants>? variants});
}

/// @nodoc
class __$$TestsImplCopyWithImpl<$Res>
    extends _$TestsCopyWithImpl<$Res, _$TestsImpl>
    implements _$$TestsImplCopyWith<$Res> {
  __$$TestsImplCopyWithImpl(
      _$TestsImpl _value, $Res Function(_$TestsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = freezed,
    Object? question = freezed,
    Object? variants = freezed,
  }) {
    return _then(_$TestsImpl(
      available: freezed == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      variants: freezed == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<Variants>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestsImpl implements _Tests {
  const _$TestsImpl(
      {this.available, this.question, final List<Variants>? variants})
      : _variants = variants;

  factory _$TestsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestsImplFromJson(json);

  @override
  final int? available;
  @override
  final String? question;
  final List<Variants>? _variants;
  @override
  List<Variants>? get variants {
    final value = _variants;
    if (value == null) return null;
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Tests(available: $available, question: $question, variants: $variants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestsImpl &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._variants, _variants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, available, question,
      const DeepCollectionEquality().hash(_variants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TestsImplCopyWith<_$TestsImpl> get copyWith =>
      __$$TestsImplCopyWithImpl<_$TestsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestsImplToJson(
      this,
    );
  }
}

abstract class _Tests implements Tests {
  const factory _Tests(
      {final int? available,
      final String? question,
      final List<Variants>? variants}) = _$TestsImpl;

  factory _Tests.fromJson(Map<String, dynamic> json) = _$TestsImpl.fromJson;

  @override
  int? get available;
  @override
  String? get question;
  @override
  List<Variants>? get variants;
  @override
  @JsonKey(ignore: true)
  _$$TestsImplCopyWith<_$TestsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Variants _$VariantsFromJson(Map<String, dynamic> json) {
  return _Variants.fromJson(json);
}

/// @nodoc
mixin _$Variants {
  int? get code => throw _privateConstructorUsedError;
  String? get variant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VariantsCopyWith<Variants> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantsCopyWith<$Res> {
  factory $VariantsCopyWith(Variants value, $Res Function(Variants) then) =
      _$VariantsCopyWithImpl<$Res, Variants>;
  @useResult
  $Res call({int? code, String? variant});
}

/// @nodoc
class _$VariantsCopyWithImpl<$Res, $Val extends Variants>
    implements $VariantsCopyWith<$Res> {
  _$VariantsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? variant = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VariantsImplCopyWith<$Res>
    implements $VariantsCopyWith<$Res> {
  factory _$$VariantsImplCopyWith(
          _$VariantsImpl value, $Res Function(_$VariantsImpl) then) =
      __$$VariantsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? code, String? variant});
}

/// @nodoc
class __$$VariantsImplCopyWithImpl<$Res>
    extends _$VariantsCopyWithImpl<$Res, _$VariantsImpl>
    implements _$$VariantsImplCopyWith<$Res> {
  __$$VariantsImplCopyWithImpl(
      _$VariantsImpl _value, $Res Function(_$VariantsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? variant = freezed,
  }) {
    return _then(_$VariantsImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VariantsImpl implements _Variants {
  const _$VariantsImpl({this.code, this.variant});

  factory _$VariantsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VariantsImplFromJson(json);

  @override
  final int? code;
  @override
  final String? variant;

  @override
  String toString() {
    return 'Variants(code: $code, variant: $variant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariantsImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.variant, variant) || other.variant == variant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, variant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VariantsImplCopyWith<_$VariantsImpl> get copyWith =>
      __$$VariantsImplCopyWithImpl<_$VariantsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VariantsImplToJson(
      this,
    );
  }
}

abstract class _Variants implements Variants {
  const factory _Variants({final int? code, final String? variant}) =
      _$VariantsImpl;

  factory _Variants.fromJson(Map<String, dynamic> json) =
      _$VariantsImpl.fromJson;

  @override
  int? get code;
  @override
  String? get variant;
  @override
  @JsonKey(ignore: true)
  _$$VariantsImplCopyWith<_$VariantsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
