import 'package:flutter/material.dart';
import 'package:platos_task/utils/routes.dart';
import 'package:platos_task/values/decoration.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Platos Task",
          style: AppDecoration.appbarheadingdecoration,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.users),
              child: Text("Screen 1"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.clubMembers),
              child: Text("Screen 2"),
            ),
          ],
        ),
      ),
    ));
  }
}
