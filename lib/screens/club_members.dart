import 'package:flutter/material.dart';
import 'package:platos_task/values/values.dart';

class ClubMembers extends StatefulWidget {
  @override
  _ClubMembersState createState() => _ClubMembersState();
}

class _ClubMembersState extends State<ClubMembers> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Screen 2",
            style: AppDecoration.appbarheadingdecoration,
          ),
        ),
      ),
    );
  }
}
