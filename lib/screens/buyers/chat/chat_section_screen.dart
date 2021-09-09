import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/Mnunuaji.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shop_app/cloud/cloud.dart';
import 'package:shop_app/models/recentChat.dart';
import 'package:shop_app/models/privateChatModel.dart';

class ChatSectionScreen extends StatefulWidget {
  static String routeName = "/chatsection";
  const ChatSectionScreen({
    Key key,
    this.mnunuaji,
  }) : super(key: key);

  final Mnunuaji mnunuaji;

  @override
  _ChatSectionScreenState createState() => _ChatSectionScreenState();
}

class _ChatSectionScreenState extends State<ChatSectionScreen> {
  TextEditingController _controllerText = TextEditingController();
  String replyTime;
  String sentAt;

  void sendMessage(String message, dynamic buyer) {
    String id = Uuid().v4();

    var readBy = [];
    readBy.add(1);
    
    PrivateChatModel(
      readBy: readBy,
      friendId: 2,
      hostId: 2,
      createdAt: replyTime,
      sentAt: sentAt,
      message: message,
      messageId: id,
    ).handleSendMessage(
      senderId: 1,
      friendId: 2,
      messageId: id,
    );

    //   final String message;
    // final int friendId;
    // final String fullName;
    // final String messageId;
    // final String sentAt;
    // final String createdAt;
    // final int hostId;
    // var readBy;

    Cloud.add(
      serverPath: "RecentChat/" + "User" + "_" + "2" + "/" + "1" + "_" + "2",
      value: RecentChat(
        lastMessage: message,
        fullName: buyer.fname,
        unseen: ServerValue.increment(0),
        time: DateTime.now().toString(),
        friendId: 1,
      ).toMap(),
    ).whenComplete(
      () async {
        Cloud.add(
          serverPath: "RecentChat/" + "User" + "_" "1" + "/" + "2" + "_" + "1",
          value: RecentChat(
            lastMessage: message,
            fullName: buyer.fname,
            unseen: ServerValue.increment(0),
            time: DateTime.now().toString(),
            friendId: 1,
          ).toMap(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Mnunuaji mnunuaji = ModalRoute.of(context).settings.arguments;
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
          middle: Text("${mnunuaji.fname}"),
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
                        child: Text("messag") // ,
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
                                        sendMessage(_controllerText.text, mnunuaji);

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
