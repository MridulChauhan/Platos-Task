import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:platos_task/components/input_textfield.dart';
import 'package:platos_task/services.dart/firebase_func.dart';
import 'package:platos_task/values/values.dart';

class UpdateDataScreen2 extends StatefulWidget {
  @override
  _UpdateDataScreen2State createState() => _UpdateDataScreen2State();
}

class _UpdateDataScreen2State extends State<UpdateDataScreen2> {
  String _id;
  String _name;
  String _email;
  String _contact;
  String _club;
  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _clubController = TextEditingController();

  void clearTextfield() {
    setState(() {
      _name = null;
      _email = null;
      _id = null;
      _contact = null;
      _club = null;
    });
    _nameController.clear();
    _emailController.clear();
    _idController.clear();
    _contactController.clear();
    _clubController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _idController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _contactController.dispose();
    _clubController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Update Club Members",
            style: AppDecoration.appbarheadingdecoration,
          ),
        ),
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
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
                    height: ScreenUtil().setHeight(10),
                  ),
                  MyInputField(
                    controller: _contactController,
                    icon: Icons.phone,
                    hinttext: "Contact",
                    onChanged: (value) {
                      setState(() => _contact = value);
                    },
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  MyInputField(
                    controller: _clubController,
                    icon: Icons.card_membership,
                    hinttext: "Club Name",
                    onChanged: (value) {
                      setState(() => _club = value);
                    },
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(15),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (_id != null &&
                          _name != null &&
                          _email != null &&
                          _club != null &&
                          _contact != null) {
                        await FirebaseFunc.updateClubMembers(
                                _id, _name, _email, _club, _contact)
                            .then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(value),
                            ),
                          );
                          clearTextfield();
                        });
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
        }),
      ),
    );
  }
}
