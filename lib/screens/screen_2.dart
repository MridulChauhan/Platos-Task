import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:platos_task/services.dart/data_model.dart';
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
        body: Column(
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Text(
              context.watch<Data>().count.toString(),
              style: _theme.textTheme.headline4,
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.updateDataScreen2),
              child: Text("Update Info"),
            ),
            Divider(),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("club_members")
                    .snapshots(),
                builder: (context, stream) {
                  if (stream.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (stream.hasError) {
                    return Center(child: Text(stream.error.toString()));
                  }
                  QuerySnapshot querySnapshot = stream.data;
                  return ListView.builder(
                    itemCount: querySnapshot.size,
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = querySnapshot.docs[index];
                      return ListTile(
                        leading:
                            Text(ds['id'], style: _theme.textTheme.headline3),
                        title:
                            Text(ds['name'], style: _theme.textTheme.headline2),
                        subtitle: Text(ds['email'],
                            style: _theme.textTheme.headline4),
                        trailing: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "${ds['contact']}\n",
                                  style: _theme.textTheme.headline4),
                              TextSpan(
                                  text: ds['club'],
                                  style: _theme.textTheme.headline5),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
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
