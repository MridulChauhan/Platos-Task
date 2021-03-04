import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:platos_task/services.dart/firebase_func.dart';
import 'package:platos_task/utils/constants.dart';
import 'package:platos_task/values/values.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
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
            "Screen 1",
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
                  onPressed: () async {
                    if (_name != null && _email != null) {
                      FirebaseFunc.addUsers(_id, _name, _email);
                      clearTextfield();
                      var userinfo = await FirebaseFunc.getUsers("17BCE0925");
                      print(userinfo);
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
