// ignore_for_file: constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:dimplom/screens/homescreen/data/cources_model.dart';
import 'package:dimplom/screens/homescreen/data/model.dart';
import 'package:dimplom/screens/homescreen/data/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repo) : super(HomeInitial());
  final Repository _repo;
  late final _interactor = CoursesInteractor(repo: _repo);

  Future<void> getDataCubit() async {
    try {
      emit(HomeLoading());
      final result = await _repo.getData();
      emit(HomeSuccess(topics: result));
    } catch (e) {
      emit(HomeError(e));
    }
  }

  Future<void> getCoursesCubit() async {
    try {
      emit(HomeLoading());
      final result = await _repo.getCources();
      emit(CoursesSuccess(courses: result));
    } catch (e) {
      emit(HomeError(e));
    }
  }

  Future<void> getTests(int index, {int? page}) async {
    try {
      emit(HomeLoading());
      await _interactor.getTests(index, page: page);
      emit(
        TestsSuccess(
          correctAnswers: _interactor.correctAnswers.toString(),
          index: _interactor.pagee,
          tests: _interactor.tests,
          selectedTests: _interactor.selectedTests,
        ),
      );
    } catch (e) {
      emit(HomeError(e));
    }
  }

  Future<void> selectTest(int index, {int? code}) async {
    try {
      emit(HomeLoading(isLoading: true));
      await _interactor.selectTest(index, code: code);
      emit(
        TestsSuccess(
          correctAnswers: _interactor.correctAnswers.toString(),
          index: _interactor.pagee,
          tests: _interactor.tests,
          selectedTests: _interactor.selectedTests,
          testStatus: TestStatus.SELECTED,
        ),
      );
    } catch (e) {
      emit(HomeError(e));
    }
  }
}

enum TestStatus { SELECTED, NOT_SELECTED }
