import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/course_card.dart';
import '../../model/wishlist/wishlist_viewmodel.dart';
import '../course/detail_course_screen.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    var wishlishedCourse = Provider.of<WishlistViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(color: Colors.black),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Wishlist Course',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: wishlishedCourse.wishlishedCourse?.length ?? 0,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              setState(() {
                wishlishedCourse.wishlishedCourse?.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      '${wishlishedCourse.wishlishedCourse?[index].courseName} Removed'),
                ),
              );
            },
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailCourseScreen(
                    index: 0,
                    // courseId: wishlishedCourse.wishlishedCourse?[index],
                  ),
                ),
              ),
              child: CourseCard(
                courseImage:
                    wishlishedCourse.wishlishedCourse?[index].courseImage ?? '',
                courseName:
                    wishlishedCourse.wishlishedCourse?[index].courseName ?? '',
                rating:
                    wishlishedCourse.wishlishedCourse?[index].totalRating ?? 0,
                totalTime:
                    wishlishedCourse.wishlishedCourse?[index].totalTime ?? '',
                totalVideo: wishlishedCourse.wishlishedCourse?[index].totalVideo
                        .toString() ??
                    '',
              ),
            ),
          );
        },
      ),
    );
  }
}
