import 'package:flutter/material.dart';
import 'package:shop_app/models/mkulima.dart';
import 'package:shop_app/screens/buyers/chat/chat_section_screen.dart';

enum MessageType { normal, photo, video, document, contact }

class MkulimaCard extends StatefulWidget {
  Mkulima mkulima;

  MkulimaCard({
    this.mkulima,
  });

  @override
  _MkulimaCardState createState() => _MkulimaCardState();
}

class _MkulimaCardState extends State<MkulimaCard> {
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () => {
            Navigator.pushNamed(
              context,
              ChatSectionScreen.routeName,
              arguments: ChatSectionScreen(
                fname: widget.mkulima.name,
                id: widget.mkulima.id,
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
            "${widget.mkulima.name}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${widget.mkulima.location}",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              Text(
                "${widget.mkulima.phone}",
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
              Text(
                "${widget.mkulima.email}",
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
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
