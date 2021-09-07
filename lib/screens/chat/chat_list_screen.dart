import 'package:flutter/material.dart';
import 'package:shop_app/screens/chat/components/chat_list_item.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            Expanded(
              child: ChatListItem(
                name: "Costantino Dionis Gwaka",
                friendId: "user-12",
                detpId: "dept-id",
                uid: "user-13",
                picture: "picture",
                count: 9,
                type: "text",
                time: "now",
                lastMessage: "naomba kujua bei za kujiunga na system",
                text: "hello habari zenu",
              ),
            ),
          ],
        );
      },
    ));
  }
}
