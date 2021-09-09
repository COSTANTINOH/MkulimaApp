import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/buyers/widgets/chat_item.dart';

class PrivateChatListTab extends StatefulWidget {
  PrivateChatListTab();
  @override
  _PrivateChatListTabState createState() => _PrivateChatListTabState();
}

class _PrivateChatListTabState extends State<PrivateChatListTab> {
  Map<String, dynamic> blocs = {};
  List<dynamic> blockersIDs = [];
  var _key = Key(DateTime.now().millisecondsSinceEpoch.toString());
  var _query = FirebaseDatabase.instance.reference().child("RecentChat/User_1");
  List selectedConv = [];
  var recentChat;
  List mychats = [];

  static Future<dynamic> getRecentChat() async {
    await FirebaseDatabase.instance.reference().child("RecentChat/User_1").once().then((snapshot) {
      return snapshot.value;
    });
  }

  @override
  void initState() {
    getRecentChat();
    FirebaseDatabase.instance.reference().child("RecentChat/User_1").onValue.listen((event) {
      setState(() {
        _query = FirebaseDatabase.instance.reference().child("RecentChat/User_1");
        _key = Key(DateTime.now().millisecondsSinceEpoch.toString());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var valueQuery = _query;
    return Scaffold(
      body: StreamBuilder(
        stream: valueQuery.onValue,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && !snapshot.hasError && snapshot.data.snapshot.value != null) {
            List listItem = [];
            Map<dynamic, dynamic> item = snapshot.data.snapshot.value;
            final now = DateTime.now();
            item.forEach(
              (key, value) {
                listItem.add(value);
              },
            );
            listItem.sort((a, b) => b["time"].compareTo(a["time"]));
            return ListView.builder(
              itemCount: listItem.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Expanded(
                      child: ChatItem(
                        friendId: listItem[index]['userId'].toString(),
                        name: listItem[index]['fullname'],
                        count: listItem[index]['unseen'],
                        time: listItem[index]['time'],
                        color: listItem[index]['color'],
                        lastMessage: listItem[index]['lastmessage'],
                        text: listItem[index]['lastmessage'],
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
