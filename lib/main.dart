import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platos_task/screens/screen_2.dart';
import 'package:platos_task/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:platos_task/screens/screen_1.dart';
import 'package:platos_task/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: HomeScreen(),
        routes: {
          AppRoutes.homeScreen: (context) => HomeScreen(),
          AppRoutes.users: (context) => Users(),
          AppRoutes.clubMembers: (context) => ClubMembers(),
        },
      ),
    );
  }
}
