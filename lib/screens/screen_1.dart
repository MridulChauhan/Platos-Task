import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:platos_task/components/input_textfield.dart';
import 'package:platos_task/services.dart/data_model.dart';
import 'package:platos_task/services.dart/firebase_func.dart';
import 'package:platos_task/utils/constants.dart';
import 'package:platos_task/utils/routes.dart';
import 'package:platos_task/values/values.dart';
import 'package:provider/provider.dart';

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
    _id = null;
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
              Text(
                context.watch<Data>().count.toString(),
                style: _theme.textTheme.headline4,
              ),
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
              ElevatedButton(
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  if (_id != null) {
                    await FirebaseFunc.getUsers(_id).then((value) {
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
                        content: Text("Please enter ID to get UserInfo"),
                      ),
                    );
                },
                child: Text("Get Info"),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.updateDataScreen),
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
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<Data>().incrementCount(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
