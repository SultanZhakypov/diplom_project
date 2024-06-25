import 'package:dimplom/components/course_card.dart';
import 'package:dimplom/model/category/category_model.dart';
import 'package:dimplom/model/course/course_model.dart';
import 'package:dimplom/model/review/review_model.dart';
import 'package:dimplom/model/section/section_model.dart';
import 'package:dimplom/model/tools/tools_model.dart';
import 'package:dimplom/screens/course/detail_course_screen.dart';
import 'package:dimplom/screens/homescreen/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getCoursesCubit();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Курсы',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is HomeLoading) {
                  if (state.isLoading == false) {
                    EasyLoading.show();
                  }
                }
              },
              buildWhen: (previous, current) => current is CoursesSuccess,
              builder: (context, state) {
                if (state is CoursesSuccess) {
                  EasyLoading.dismiss();

                  return Expanded(
                    child: ListView.separated(
                      itemCount: state.courses.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailCourseScreen(
                                  courseId: state.courses[index],
                                  index: index,
                                ),
                              ),
                            );
                          },
                          child: CourseCard(
                            courseImage: state.courses[index].image ?? '',
                            courseName: state.courses[index].title ?? '',
                            rating: mockData[index].totalRating ?? 0,
                            totalTime: mockData[index].totalTime ?? '',
                            totalVideo: mockData[index].totalVideo.toString(),
                          ),
                        );
                      },
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

List<CourseModel> mockData = [
  CourseModel(
    id: 1,
    courseName: 'sdk',
    courseImage: 'sdk',
    category: CategoryModel(id: 2),
    description: 'sdk',
    totalVideo: 1,
    totalTime: 'sdk',
    totalRating: 1.3,
    sections: [
      Section(id: 4),
      Section(id: 5),
    ],
    reviews: [
      Review(id: 52),
      Review(id: 51),
    ],
    tools: [
      Tools(id: 4),
    ],
  ),
  CourseModel(
    id: 6,
    courseName: 'sdk',
    courseImage: 'sdk',
    category: CategoryModel(id: 2),
    description: 'sdk',
    totalVideo: 50,
    totalTime: 'sdk',
    totalRating: 1.3,
    sections: [
      Section(id: 4),
      Section(id: 5),
    ],
    reviews: [
      Review(id: 52),
      Review(id: 51),
    ],
    tools: [
      Tools(id: 4),
    ],
  ),
];
