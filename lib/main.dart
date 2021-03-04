import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platos_task/screens/club_members.dart';
import 'package:platos_task/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:platos_task/screens/users.dart';
import 'package:platos_task/utils/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();
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
