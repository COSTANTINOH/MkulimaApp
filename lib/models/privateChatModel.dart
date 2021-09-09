import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PrivateChatModel {
  final String message;
  final int friendId;
  final String fullName;
  final String messageId;
  final String sentAt;
  final String createdAt;
  final int hostId;
  var readBy;

  PrivateChatModel({
    this.friendId,
    this.message,
    this.fullName,
    this.createdAt,
    this.sentAt,
    this.messageId,
    this.hostId,
    this.readBy,
  });


  // static handleAddUserChat(BuildContext context, {String message, String convoId, RecentChat model}) async {
  //   if (await DataConnectionChecker().hasConnection) {
  //     Cloud.add(serverPath: "RecentChat/" + "Jatutalk_" + TalkUser.talkDataHolder.id.toString() + "/" + convoId, value: model.toMap());
  //   } else {
  //     popFeedback(context,
  //         title: I18n.translate(context, 'pop.internet.internet'), error: true, content: I18n.translate(context, 'pop.internet.internetFeedback'));
  //   }
  // }

  handleSendMessage({String messageId, int senderId, int friendId}) {
    print("message send $senderId $friendId $messageId");
    FirebaseDatabase.instance.reference().child('privateMessage/' + "$senderId" + "/" + "$friendId" + "/" + messageId).set({
      "receiverId": friendId,
      "senderId": hostId,
      "messageId": messageId,
      "createdAt": DateTime.now().toString(),
      "sentAt": DateTime.now().toString(),
      "message": message,
      "readBy": readBy,
    }).whenComplete(
      () => {
        FirebaseDatabase.instance.reference().child('privateMessage/' + "$friendId" + "/" + "$senderId" + "/" + messageId).set(
          {
            "receiverId": friendId,
            "senderId": hostId,
            "messageId": messageId,
            "createdAt": DateTime.now().toString(),
            "sentAt": DateTime.now().toString(),
            "message": message,
            "readBy": readBy,
          },
        ),
      },
    );

    // .set(model.toMap());
  }

}
