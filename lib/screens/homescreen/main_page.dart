import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/course/course_viewmodel.dart';
import '../../model/profile/profile_viewmodel.dart';
import '../screen.dart';

class MainPage extends StatefulWidget {
  int? id;
  int? index;
  MainPage({super.key, this.id, this.index});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [
    const HomeScreen(),
    const CourseScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    Provider.of<CourseViewModel>(context, listen: false).getAllCourse();
    Provider.of<CourseViewModel>(context, listen: false).getAllCategory();
    Provider.of<ProfileViewModel>(context, listen: false).getEnrolledCourse();
    Provider.of<ProfileViewModel>(context, listen: false).getWhoLogin();
    currentIndex = widget.index ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        selectedItemColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Главная'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded), label: 'Курсы'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: 'Профиль'),
        ],
      ),
    );
  }
}
