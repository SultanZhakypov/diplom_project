import 'dart:developer';

import 'package:dimplom/api/dio_generator.dart';
import 'package:dimplom/screens/homescreen/data/cources_model.dart';
import 'package:dimplom/screens/homescreen/data/model.dart';

class Repository {
  final DioSettings dio;
  Repository({
    required this.dio,
  });

  Future<List<HomeModelTopics>> getData() async {
    try {
      final response = await dio.dio.get('topics.json');
      log('data-unique: response.data: ${response.data} ');
      List<dynamic> topics = response.data as List<dynamic>;
      final result = topics
          .map<HomeModelTopics>(
            (e) => HomeModelTopics.fromMap(e),
          )
          .toList();

      log('data-unique: result: $result ');

      return result;
    } catch (e) {
      log('data-unique: e: $e ');
    }

    return [];
  }

  Future<List<Courses>> getCources() async {
    try {
      final response = await dio.dio.get('courses.json');
      List<dynamic> courses = response.data as List<dynamic>;
      final result = courses
          .map<Courses>(
            (e) => Courses.fromJson(e),
          )
          .toList();

      return result;
    } catch (e) {
      log('data-unique: e: $e ');
    }

    return [];
  }
}

class ResultsModel {
  final String totalTests;
  final String correctVariants;

  ResultsModel({
    required this.totalTests,
    required this.correctVariants,
  });
}

class CoursesInteractor {
  final Repository repo;

  CoursesInteractor({required this.repo});
  List<Tests> tests = [];
  List<bool?> selectedTests = [];
  int pagee = 0;
  int correctAnswers = 0;

  Future<void> getTests(int index, {int? page}) async {
    if (page == 0) {
      pagee = 0;
      correctAnswers = 0;
    }
    if (page == null) {
      pagee++;
    }
    final res = await repo.getCources();
    tests = res[index].tests ?? [];
    selectedTests =
        List.generate(tests[pagee].variants?.length ?? 0, (index) => null);

  }

  Future<void> selectTest(int index, {int? code}) async {
    if (code == tests[pagee].available) {
      selectedTests[index] = true;
    } else {
      selectedTests[index] = false;
    }
    if (tests[pagee].available == code) {
      correctAnswers++;
    }
  }
}
