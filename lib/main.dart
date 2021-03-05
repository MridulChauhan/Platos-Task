import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platos_task/screens/add_data_screen.dart';
import 'package:platos_task/screens/add_data_screen2.dart';
import 'package:platos_task/screens/screen_2.dart';
import 'package:platos_task/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:platos_task/screens/screen_1.dart';
import 'package:platos_task/screens/update_screen.dart';
import 'package:platos_task/screens/update_screen2.dart';
import 'package:platos_task/services.dart/data_model.dart';
import 'package:platos_task/utils/utils.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: () => ChangeNotifierProvider(
        create: (context) => Data(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          home: HomeScreen(),
          routes: {
            AppRoutes.homeScreen: (context) => HomeScreen(),
            AppRoutes.users: (context) => Users(),
            AppRoutes.clubMembers: (context) => ClubMembers(),
            AppRoutes.addDataScreen: (context) => AddDataScreen(),
            AppRoutes.addDataScreen2: (context) => AddDataScreen2(),
            AppRoutes.updateDataScreen: (context) => UpdateDataScreen(),
            AppRoutes.updateDataScreen2: (context) => UpdateDataScreen2(),
          },
        ),
      ),
    );
  }
}
