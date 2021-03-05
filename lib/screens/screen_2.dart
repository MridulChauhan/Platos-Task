import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:platos_task/components/input_textfield.dart';
import 'package:platos_task/services.dart/data_model.dart';
import 'package:platos_task/services.dart/firebase_func.dart';
import 'package:platos_task/utils/constants.dart';
import 'package:platos_task/utils/routes.dart';
import 'package:platos_task/values/values.dart';
import 'package:provider/provider.dart';

class ClubMembers extends StatefulWidget {
  @override
  _ClubMembersState createState() => _ClubMembersState();
}

class _ClubMembersState extends State<ClubMembers> {
  List<String> _keys = [];
  List<dynamic> _values = [];
  String _email;
  TextEditingController _emailController = TextEditingController();

  void clearTextfield() {
    _emailController.clear();
    _email = "";
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  right: AppConstants.horizontalPadding * 0.5),
              child: IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.addDataScreen2),
                icon: Icon(
                  Icons.add,
                  size: AppConstants.iconSize,
                ),
              ),
            ),
          ],
          centerTitle: true,
          title: Text(
            "Screen 2",
            style: AppDecoration.appbarheadingdecoration,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: AppConstants.verticalPadding * 2),
          child: Column(
            children: [
              Text(
                context.watch<Data>().count.toString(),
                style: _theme.textTheme.headline4,
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
              ElevatedButton(
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  if (_email != null) {
                    await FirebaseFunc.getUsers(_email).then((value) {
                      //print(value);
                      setState(() {
                        if (value.length != 0) {
                          _keys = value[0].keys.toList();
                          _values = value[0].values.toList();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("User ID does not exist"),
                            ),
                          );
                          _keys = [];
                          _values = [];
                        }
                      });
                    });
                    clearTextfield();
                  } else
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please enter Email to get UserInfo"),
                      ),
                    );
                },
                child: Text("Get Info"),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.updateDataScreen2),
                child: Text("Update Info"),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppConstants.verticalPadding * 0.5,
                    horizontal: AppConstants.horizontalPadding * 0.5),
                child: (_keys.length != 0 && _values.length != 0)
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: _keys.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Text(
                              _keys[index].toUpperCase(),
                              style: _theme.textTheme.headline1,
                            ),
                            trailing: Text(
                              _values[index],
                              style: _theme.textTheme.headline2,
                            ),
                          );
                        })
                    : Container(),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<Data>().incrementCount(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
