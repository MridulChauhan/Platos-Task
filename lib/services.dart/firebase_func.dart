import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFunc {
  static addUsers(String id, String name, String email) {
    Map<String, dynamic> data = {"name": name, "email": email};
    DocumentReference _users =
        FirebaseFirestore.instance.collection("users").doc(id);
    _users.set(data);
  }

  static addClubMember(
      String name, String email, String clubname, String id, String contact) {
    Map<String, dynamic> data = {
      "name": name,
      "email": email,
      "club_name": clubname,
      "id": id,
      "contact": contact
    };
    CollectionReference _clubmember =
        FirebaseFirestore.instance.collection("club_member");
    _clubmember.add(data);
  }

  static Future<List<Map<String, dynamic>>> getUsers(String userid) {
    var userinfo = FirebaseFirestore.instance
        .collection("users")
        .doc("$userid")
        .get()
        .then((value) {
      return getUsersInfoForParameter(value.data());
      //return value.data();
    });
    return userinfo;
  }

  static Future<List<Map<String, dynamic>>> getUsersInfoForParameter(
      Map<String, dynamic> userinfo) {
    List<Map<String, dynamic>> list = [];
    return FirebaseFirestore.instance
        .collection("club_members")
        .where("email", isEqualTo: "${userinfo['email']}")
        .get()
        .then((value) => value.docs.forEach((result) {
              list.add(result.data());
            }))
        .then((_) => list);
  }
}
