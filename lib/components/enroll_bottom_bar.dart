import 'package:dimplom/model/course/course_viewmodel.dart';
import 'package:dimplom/model/profile/profile_viewmodel.dart';
import 'package:dimplom/screens/homescreen/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnrollBottomBar extends StatelessWidget {
  const EnrollBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final course = Provider.of<CourseViewModel>(context);
    final user = Provider.of<ProfileViewModel>(context);
    return Container(
      width: double.infinity,
      height: 70,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(62, 158, 158, 158),
            blurRadius: 15,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ElevatedButton(
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(index: 1),
              ),
            );
          },
          child: const Text('Закрыть'),
        ),
      ),
    );
  }
}
