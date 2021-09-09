import 'package:flutter/material.dart';
import 'package:shop_app/models/mkulima.dart';

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
    return ListTile(
      onTap: () => {},
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage("assets/images/user.png"),
      ),
      title: Text(
        "${widget.mkulima.name}",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      subtitle: Text("${widget.mkulima.location}"),
      trailing: IconButton(
        icon: Icon(
          Icons.chat_bubble,
          color: Colors.black45,
        ),
        onPressed: () {},
      ),
    );
  }
}
