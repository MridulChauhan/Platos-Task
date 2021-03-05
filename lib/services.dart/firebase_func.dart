import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFunc {
  static addUsers(String id, String name, String email) {
    Map<String, dynamic> data = {"name": name, "email": email};
    DocumentReference _users =
        FirebaseFirestore.instance.collection("users").doc(id);
    _users.set(data);
  }

  static addClubMember(
      String id, String name, String email, String clubname, String contact) {
    Map<String, dynamic> data = {
      "name": name,
      "email": email,
      "club_name": clubname,
      "id": id,
      "contact": contact
    };
    DocumentReference _clubmember =
        FirebaseFirestore.instance.collection("club_members").doc(id);
    _clubmember.set(data);
  }

  static Future<List<Map<String, dynamic>>> getUsers(String userid) {
    var userinfo = FirebaseFirestore.instance
        .collection("users")
        .doc("$userid")
        .get()
        .then((value) {
      return getUsersInfoForParameter(value.data());
    });
    return userinfo;
  }

  static Future<List<Map<String, dynamic>>> getUsersInfoForParameter(
      Map<String, dynamic> userinfo) {
    List<Map<String, dynamic>> list = [];
    if (userinfo == null) return Future.value(list);
    return FirebaseFirestore.instance
        .collection("club_members")
        .where("email", isEqualTo: "${userinfo['email']}")
        .get()
        .then((value) => value.docs.forEach((result) {
              list.add(result.data());
            }))
        .then((_) => list)
        .onError((error, stackTrace) => Future.value(list));
  }

  static Future<String> updateUsers(String id, String name, String email) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc('$id')
        .update({
          "name": name,
          "email": email,
        })
        .then((_) => Future.value("Success"))
        .onError((error, stackTrace) => Future.value("Could not update data"));
  }
}
