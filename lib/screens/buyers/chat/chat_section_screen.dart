import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/Mnunuaji.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shop_app/cloud/cloud.dart';
import 'package:shop_app/models/recentChat.dart';
import 'package:shop_app/models/privateChatModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatSectionScreen extends StatefulWidget {
  static String routeName = "/chatsection";
  const ChatSectionScreen({Key key, this.id, this.fname}) : super(key: key);

  final String id;
  final String fname;

  @override
  _ChatSectionScreenState createState() => _ChatSectionScreenState();
}

class _ChatSectionScreenState extends State<ChatSectionScreen> {
  TextEditingController _controllerText = TextEditingController();
  String replyTime;
  String sentAt;
  var hostIdMe;

  @override
  void initState() {
    super.initState();
    asyncMethod();
  }

  // Future<void> userId() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'userId';
  //   hostIdMe = prefs.get(key) ?? 0;
  // }

  void asyncMethod() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'userId';
    final hostId = prefs.get(key) ?? 0;
    setState(() {
      hostIdMe = hostId;
    });
  }

  Future<void> sendMessage(String message, dynamic buyer) async {
    String id = Uuid().v4();

    var readBy = [];
    // final prefs = await SharedPreferences.getInstance();
    // final key = 'userId';
    // final hostId = prefs.get(key) ?? 0;

    readBy.add(hostIdMe);

    PrivateChatModel(
      readBy: readBy,
      friendId: 2,
      hostId: 2,
      createdAt: replyTime,
      sentAt: sentAt,
      message: message,
      messageId: id,
    ).handleSendMessage(
      senderId: int.parse(hostIdMe),
      friendId: int.parse(buyer.id),
      messageId: id,
    );

    Cloud.add(
      serverPath: "RecentChat/" + "User" + "_" + hostIdMe + "/" + hostIdMe + "_" + buyer.id,
      value: RecentChat(
        lastMessage: message,
        fullName: buyer.fname,
        unseen: ServerValue.increment(0),
        time: DateTime.now().toString(),
        friendId: int.parse(buyer.id),
      ).toMap(),
    ).whenComplete(
      () async {
        Cloud.add(
          serverPath: "RecentChat/" + "User" + "_" + buyer.id + "/" + buyer.id + "_" + hostIdMe,
          value: RecentChat(
            lastMessage: message,
            fullName: buyer.fname,
            unseen: ServerValue.increment(0),
            time: DateTime.now().toString(),
            friendId: int.parse(hostIdMe),
          ).toMap(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as ChatSectionScreen;
    return WillPopScope(
      onWillPop: () {
        print("on will scope");
      },
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          middle: Text("${args.fname}"),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/chat_back.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/chat_back.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: StreamBuilder(
                          stream: FirebaseDatabase.instance
                              .reference()
                              .child(
                                "privateMessage/" + hostIdMe + "/" + args.id,
                              )
                              .orderByChild('createdAt')
                              .onValue,
                          builder: (_, snap) {
                            if (snap.hasData) {
                              var _data = [];

                              if (snap.data.snapshot.value != null) {
                                Map<dynamic, dynamic> map = snap.data.snapshot.value;
                                _data = map.values.toList()..sort((a, b) => b['sentAt'].compareTo(a['sentAt']));
                              }

                              return snap.data.snapshot.value == null && _data.length == 0
                                  ? Center(
                                      child: Text(
                                        "no message",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    )
                                  : ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      reverse: true,
                                      itemCount: _data.length,
                                      itemBuilder: (_, i) {
                                        var snap = _data[i];
                                        return Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              (snap['senderId'].toString() == hostIdMe.toString()) ? MainAxisAlignment.end : MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Card(
                                                elevation: 2,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(10),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 1.0,
                                                          spreadRadius: 0.0,
                                                          offset: Offset(1.0, 1.0),
                                                        )
                                                      ],
                                                      color: (hostIdMe.toString() != snap['senderId'].toString() ? Colors.white : Colors.white),
                                                      borderRadius: (hostIdMe == snap['senderId'])
                                                          ? BorderRadius.only(
                                                              bottomLeft: Radius.circular(10.0),
                                                              topLeft: Radius.circular(10.0),
                                                              bottomRight: Radius.circular(20.0),
                                                            )
                                                          : BorderRadius.only(
                                                              bottomLeft: Radius.circular(10.0),
                                                              topRight: Radius.circular(10.0),
                                                              bottomRight: Radius.circular(10.0),
                                                            ),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          width: 100,
                                                          constraints: BoxConstraints(minWidth: 50),
                                                          margin: EdgeInsets.only(bottom: 2.0, top: 0.0, left: 0, right: 0),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Material(
                                                              color: (hostIdMe != snap['senderId']) ? Colors.white : Colors.lightGreen[200],
                                                              child: Text(
                                                                "${snap['message']}",
                                                                style: TextStyle(
                                                                  fontSize: 13.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                            } else {
                              return Text("no message");
                            }
                          },
                        ) // ,
                        ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Card(
                                  margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: TextFormField(
                                    controller: _controllerText,
                                    autofocus: true,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: "Type a comments",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [],
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.all(15),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 8,
                                  right: 2,
                                  left: 2,
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Color(0xFF128C7E),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.send,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        if (_controllerText.text == null || _controllerText.text.isEmpty) return;
                                        sendMessage(_controllerText.text, args);
                                        _controllerText.clear();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
