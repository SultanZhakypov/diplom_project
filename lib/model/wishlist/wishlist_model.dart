import 'package:dimplom/model/course/course_model.dart';

class WishlistModel {
  int userId;
  List<CourseModel> wishlishedCourse;

  WishlistModel({
    required this.userId,
    required this.wishlishedCourse,
  });
}
