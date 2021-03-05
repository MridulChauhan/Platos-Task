import 'package:flutter/material.dart';
import 'package:platos_task/services.dart/data_model.dart';
import 'package:platos_task/utils/routes.dart';
import 'package:platos_task/values/decoration.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: SafeArea(
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
      )),
    );
  }
}
