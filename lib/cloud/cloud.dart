import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cloud {
  static Future add(
      {String serverPath, dynamic value, String serverTime}) async {
    try {
      await FirebaseDatabase.instance
          .reference()
          .child('$serverPath')
          .set(value, priority: serverTime);
    } catch (e) {
      print(e);
    }
  }

  ///get real-time firebase database data
  static Future getRealTimeData({String serverPath}) async {
    try {
      return await FirebaseDatabase.instance
          .reference()
          .child('$serverPath')
          .once()
          .then((data) => data.value);
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<void> addRecentChar({String serverPath, dynamic data}) async {
    try {
      await FirebaseFirestore.instance.doc(serverPath).set(data);
    } catch (e) {
      print("rich here haha $e");
    }
  }

  ///upload contents to firestore cloud DB
  static Future<void> upload({String serverPath, dynamic data}) async {
    try {
      await FirebaseFirestore.instance.doc(serverPath).set(data);
    } catch (e) {
      print("rich here haha $e");
    }
  }

  ///update data to firestore cloud DB
  static Future<void> updateFirestore({String serverPath, dynamic data}) async {
    try {
      await FirebaseFirestore.instance
          .doc(serverPath)
          .update(data)
          .catchError((onError) => print("error is : $onError"));
    } catch (e) {
      print("error is this is erorr occured to: $e");
    }
  }

  static Future<void> updateFBFirestore(
      {String serverPath, dynamic data}) async {
    try {
      await FirebaseDatabase.instance
          .reference()
          .child('$serverPath')
          .update(data);
    } catch (e) {
      print("this is error from: $e");
    }
  }

  static Future update(
      {bool checkSnap = true, String serverPath, dynamic value}) async {
    try {
      if (checkSnap) {
        await FirebaseDatabase.instance
            .reference()
            .child('$serverPath')
            .once()
            .then((snapshot) async {
          if (snapshot.value != null) {
            await FirebaseDatabase.instance
                .reference()
                .child('$serverPath')
                .update(value);
          }
        });
      } else {
        await FirebaseDatabase.instance
            .reference()
            .child('$serverPath')
            .update(value);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future updateAll({String serverPath, dynamic value}) async {
    try {
      FirebaseDatabase.instance.reference().child('$serverPath');
    } catch (e) {
      print(e);
    }
  }

  static Future<void> delete({String serverPath}) async {
    try {
      await FirebaseDatabase.instance.reference().child('$serverPath').remove();
      // await FirebaseFirestore.instance.doc('$serverPath').delete();
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deleteFirestore({String serverPath}) async {
    try {
      await FirebaseFirestore.instance.doc(serverPath).delete();
    } catch (e) {
      print(e);
    }
  }

  ///set data to firestoreDB
  static Future<void> addFirestore({String serverPath, dynamic data}) async {
    try {
      await FirebaseFirestore.instance.doc(serverPath).set(data);
    } catch (e) {
      print(e);
    }
  }

  static Future removemember({String serverPath, dynamic value}) async {
    try {
      await FirebaseDatabase.instance
          .reference()
          .child('$serverPath')
          .update(value);
    } catch (e) {
      print(e);
    }
  }

  static Future addmessage({String serverPath, dynamic value}) async {
    try {
      await FirebaseDatabase.instance
          .reference()
          .child('$serverPath')
          .set(value);
    } catch (e) {
      print(e);
    }
  }

  static Future addMember({String serverPath, dynamic value}) async {
    try {
      await FirebaseDatabase.instance
          .reference()
          .child('$serverPath')
          .set(value);
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> onlineStatus({userId}) async {
    var rest = await FirebaseDatabase.instance
        .reference()
        .child("UserOnlineStatus/" + userId)
        .once()
        .then((DataSnapshot snapshot) {
      return snapshot.value;
    });
    return rest;
  }

  static Future<String> getOnlineStatus(userid) async {
    DataSnapshot snapshot = await FirebaseDatabase.instance
        .reference()
        .child("UserOnlineStatus/$userid")
        .once();
    if (snapshot.value["isOnline"]) {
      return "true";
    } else {
      return snapshot.value["lastSeen"];
    }
  }
}
