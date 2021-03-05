import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function onChanged;
  final String hinttext;
  final IconData icon;
  MyInputField({this.controller, this.onChanged, this.hinttext, this.icon});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hinttext,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
