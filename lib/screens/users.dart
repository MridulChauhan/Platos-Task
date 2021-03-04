import 'package:flutter/material.dart';
import 'package:platos_task/values/values.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Screen 1",
          style: AppDecoration.appbarheadingdecoration,
        ),
      ),
    ));
  }
}
