import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:platos_task/services.dart/firebase_func.dart';
import 'package:platos_task/utils/constants.dart';
import 'package:platos_task/utils/routes.dart';
import 'package:platos_task/values/values.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List<String> _keys = [];
  List<dynamic> _values = [];
  String _id;
  TextEditingController _idController = TextEditingController();

  void clearTextfield() {
    _idController.clear();
    _id = "";
  }

  @override
  void dispose() {
    super.dispose();
    _idController.dispose();
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
                    Navigator.pushNamed(context, AppRoutes.addDataScreen),
                icon: Icon(
                  Icons.add,
                  size: AppConstants.iconSize,
                ),
              ),
            ),
          ],
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
              ElevatedButton(
                onPressed: () async {
                  if (_id != null) {
                    await FirebaseFunc.getUsers(_id).then((value) {
                      setState(() {
                        _keys = value[0].keys.toList();
                        _values = value[0].values.toList();
                      });
                    });
                    clearTextfield();
                  } else
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please enter ID to get UserInfo"),
                      ),
                    );
                },
                child: Text("Get Info"),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.updateScreen),
                child: Text("Update Info"),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppConstants.verticalPadding * 0.5,
                    horizontal: AppConstants.horizontalPadding * 0.5),
                child: (_keys != null && _values != null)
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
      ),
    );
  }
}
