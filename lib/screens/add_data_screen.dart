import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:platos_task/services.dart/firebase_func.dart';
import 'package:platos_task/utils/constants.dart';
import 'package:platos_task/values/values.dart';

class AddDataScreen extends StatefulWidget {
  @override
  _AddDataScreenState createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  String _id;
  String _name;
  String _email;
  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  void clearTextfield() {
    _nameController.clear();
    _emailController.clear();
    _idController.clear();
    _name = "";
    _email = "";
    _id = "";
  }

  @override
  void dispose() {
    super.dispose();
    _idController.dispose();
    _nameController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Add Data",
            style: AppDecoration.appbarheadingdecoration,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: AppConstants.verticalPadding * 2),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: new TextField(
                  controller: _idController,
                  decoration: new InputDecoration(
                    hintText: "ID",
                  ),
                  onChanged: (value) {
                    setState(() => _id = value);
                  },
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: new TextField(
                  controller: _nameController,
                  decoration: new InputDecoration(
                    hintText: "Name",
                  ),
                  onChanged: (value) {
                    setState(() => _name = value);
                  },
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: new TextField(
                  controller: _emailController,
                  decoration: new InputDecoration(
                    hintText: "Email",
                  ),
                  onChanged: (value) {
                    setState(() => _email = value);
                  },
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_id != null && _name != null && _email != null) {
                      FirebaseFunc.addUsers(_id, _name, _email);
                      clearTextfield();
                    } else
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please enter data to add"),
                        ),
                      );
                  },
                  child: Text("Add Data"))
            ],
          ),
        ),
      ),
    );
  }
}