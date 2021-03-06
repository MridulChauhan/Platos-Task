import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:platos_task/components/input_textfield.dart';
import 'package:platos_task/services.dart/firebase_func.dart';
import 'package:platos_task/utils/constants.dart';
import 'package:platos_task/values/values.dart';

class UpdateDataScreen extends StatefulWidget {
  @override
  _UpdateDataScreenState createState() => _UpdateDataScreenState();
}

class _UpdateDataScreenState extends State<UpdateDataScreen> {
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
    _name = null;
    _email = null;
    _id = null;
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
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Update Users",
            style: AppDecoration.appbarheadingdecoration,
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyInputField(
                      controller: _idController,
                      icon: Icons.perm_identity,
                      hinttext: "ID",
                      onChanged: (value) {
                        setState(() => _id = value);
                      },
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    MyInputField(
                      controller: _nameController,
                      icon: Icons.person,
                      hinttext: "Name",
                      onChanged: (value) {
                        setState(() => _name = value);
                      },
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    MyInputField(
                      controller: _emailController,
                      icon: Icons.email,
                      hinttext: "Email",
                      onChanged: (value) {
                        setState(() => _email = value);
                      },
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(15),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (_id != null && _name != null && _email != null) {
                          await FirebaseFunc.updateUsers(_id, _name, _email)
                              .then(
                            (value) =>
                                ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(value),
                              ),
                            ),
                          );
                          clearTextfield();
                        } else
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please enter data to update"),
                            ),
                          );
                      },
                      child: Text("Update Data"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
