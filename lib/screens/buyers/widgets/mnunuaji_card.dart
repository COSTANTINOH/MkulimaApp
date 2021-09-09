import 'package:flutter/material.dart';
import 'package:shop_app/models/Mnunuaji.dart';
import 'package:shop_app/screens/buyers/chat/chat_section_screen.dart';

enum MessageType { normal, photo, video, document, contact }

class MnunuajiCard extends StatefulWidget {
  Mnunuaji mnunuaji;

  MnunuajiCard({
    this.mnunuaji,
  });

  @override
  _MnunuajiCardState createState() => _MnunuajiCardState();
}

class _MnunuajiCardState extends State<MnunuajiCard> {
  TextStyle media = TextStyle(fontSize: 14);
  TextStyle small = TextStyle(fontSize: 10);
  double iconSize = 18;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () => {
            Navigator.pushNamed(
              context,
              ChatSectionScreen.routeName,
              arguments: ChatSectionScreen(
                fname: widget.mnunuaji.fname, 
                id: widget.mnunuaji.id,
              ),
            )
          },
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(
              "assets/images/user.png",
            ),
          ),
          title: Text(
            "${widget.mnunuaji.fname}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${widget.mnunuaji.location}",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              Text(
                "${widget.mnunuaji.phone}",
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.chat_bubble,
              color: Colors.black45,
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                ChatSectionScreen.routeName,
                arguments: widget.mnunuaji,
              );
            },
          ),
        ),
      ),
    );
  }
}
