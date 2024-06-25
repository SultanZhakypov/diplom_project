part of 'home_cubit.dart';

@immutable
sealed class HomeState extends Equatable {}

final class HomeInitial extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

final class HomeLoading extends HomeState {
  @override
  // TODO: implement props
  final bool isLoading;

  HomeLoading({this.isLoading = false});
  @override
  List<Object?> get props => [isLoading];
}

final class HotDogState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

final class HomeSuccess extends HomeState {
  final List<HomeModelTopics> topics;

  HomeSuccess({required this.topics});

  @override
  // TODO: implement props
  List<Object?> get props => [topics];
}

final class CoursesSuccess extends HomeState {
  final List<Courses> courses;

  CoursesSuccess({required this.courses});

  @override
  // TODO: implement props
  List<Object?> get props => [courses];
}

final class TestsSuccess extends HomeState {
  final List<Tests> tests;
  final List<bool?> selectedTests;
  final TestStatus testStatus;
  final int index;
  final String? correctAnswers;

  TestsSuccess({
    this.correctAnswers,
    required this.tests,
    required this.index,
    required this.selectedTests,
    this.testStatus = TestStatus.NOT_SELECTED,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [tests, selectedTests];
}

final class HomeError extends HomeState {
  HomeError(this.exception);
  final dynamic exception;

  @override
  // TODO: implement props
  List<Object?> get props => [exception];
}
