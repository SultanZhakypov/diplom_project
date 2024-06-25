import 'package:dimplom/api/dio_generator.dart';
import 'package:dimplom/firebase_options.dart';
import 'package:dimplom/model/course/course_viewmodel.dart';
import 'package:dimplom/screens/homescreen/data/repository.dart';
import 'package:dimplom/screens/homescreen/presentation/cubit/home_cubit.dart';
import 'package:dimplom/screens/screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'model/auth/auth_viewmodel.dart';
import 'model/profile/profile_viewmodel.dart';
import 'model/wishlist/wishlist_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) =>
              Repository(dio: RepositoryProvider.of<DioSettings>(context)),
        ),
        BlocProvider(
          create: (context) => HomeCubit(
            RepositoryProvider.of<Repository>(context),
          ),
        )
      ],
      child: const MyApp(),
    ),
  );

  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..indicatorType = EasyLoadingIndicatorType.doubleBounce
    ..animationStyle = EasyLoadingAnimationStyle.scale;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => CourseViewModel()),
        ChangeNotifierProvider(create: (_) => WishlistViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Edutiv',
        theme: ThemeData(
          tabBarTheme: const TabBarTheme(
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color.fromARGB(255, 11, 8, 18),
              selectedItemColor: Colors.deepPurpleAccent,
              selectedIconTheme: IconThemeData(color: Colors.deepPurpleAccent),
              unselectedItemColor: Colors.white,
              selectedLabelStyle: TextStyle(color: Colors.deepPurpleAccent),
              unselectedIconTheme: IconThemeData(color: Colors.white)),
          hintColor: Colors.white,
          iconButtonTheme: const IconButtonThemeData(
              style: ButtonStyle(
                  iconColor: MaterialStatePropertyAll(Colors.white))),
          textTheme: const TextTheme(
            displayLarge: TextStyle(color: Colors.white),
            displayMedium: TextStyle(color: Colors.white),
            displaySmall: TextStyle(color: Colors.white),
            headlineLarge: TextStyle(color: Colors.white),
            headlineMedium: TextStyle(color: Colors.white),
            headlineSmall: TextStyle(color: Colors.white),
            titleLarge: TextStyle(color: Colors.white),
            titleMedium: TextStyle(color: Colors.white),
            titleSmall: TextStyle(color: Colors.white),
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white),
            labelLarge: TextStyle(color: Colors.white),
            labelMedium: TextStyle(color: Colors.white),
            labelSmall: TextStyle(color: Colors.white),
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 11, 8, 18),
          primaryColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle: const TextStyle(color: Colors.black),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(),
          ),
          checkboxTheme: CheckboxThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
            backgroundColor: Colors.transparent,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          fontFamily: 'Poppins',
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: Color(0xFF126E64),
          ),
        ),
        builder: EasyLoading.init(),
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/forgetPassword': (context) => const ForgetPasswordScreen(),
          '/confirmPasswordReset': (context) =>
              const ConfirmPasswordResetScreen(),
          '/passwordReset': (context) => const PasswordResetScreen(),
          '/passwordResetSuccess': (context) =>
              const PasswordResetSuccessScreen(),
          '/mainpage': (context) => MainPage(),
          '/homeScreen': (context) => const HomeScreen(),
          '/courseScreen': (context) => const CourseScreen(),
          '/myCourse': (context) => const MyCourseScreen(),
          '/detailCourse': (context) => const DetailCourseScreen(index: 0),
          '/learningCourse': (context) => const LearningCourseScreen(),
          '/successCourse': (context) => const SuccessCourseScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/editProfile': (context) => const EditProfileScreen(),
          '/faq': (context) => const FAQScreen(),
          '/formRequest': (context) => const FormRequestScreen(),
          '/certificate': (context) => const CertificateScreen(),
          '/certificateDetail': (context) => const CertificateDetailScreen(),
          '/dataReport': (context) => const DataReportScreen(),
          '/search': (context) => const SearchScreen(),
        },
      ),
    );
  }
}
