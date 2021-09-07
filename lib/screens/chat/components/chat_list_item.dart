import 'package:flutter/material.dart';

enum MessageType { normal, photo, video, document, contact }

class ChatListItem extends StatefulWidget {
  final String name;
  final String uid;
  final String picture;
  final bool online;
  final bool selected;
  final int count;
  final String type;
  final String text;
  final String time;
  final String lastMessage;
  final String friendId;
  final String detpId;

  ChatListItem(
      {@required this.name,
      this.friendId,
      this.detpId,
      this.uid,
      @required this.picture,
      this.online,
      @required this.count,
      @required this.type,
      this.text,
      this.selected,
      this.lastMessage,
      @required this.time});

  @override
  _ChatListItemState createState() => _ChatListItemState();
}

class _ChatListItemState extends State<ChatListItem> {
  TextStyle media = TextStyle(fontSize: 14);
  TextStyle small = TextStyle(fontSize: 10);
  double iconSize = 18;
  String token = null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {},
      // onLongPress: widget.onLongPress,
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage("assets/images/user.png"),
        // backgroundImage: cachedProvider(context, image: widget.picture),
        // child: _renderOnline(),
      ),
      title: Text(
        "${widget.name}",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      subtitle: _renderSubtitle(context),
      trailing: _renderTailing(context),
    );
  }

  Widget _count(BuildContext context) {
    return CircleAvatar(
      radius: 10,
      backgroundColor: Colors.green,
      child: Text(
        widget.count < 100 ? widget.count.toString() : "99+",
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),
      ),
    );
  }

  Widget _renderTailing(BuildContext context) {
    if (widget.count > 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(width: 5),
          _count(context),
          SizedBox(width: 5),
          Text(
            widget.time,
            style: small,
          )
        ],
      );
    } else {
      return Text(
        widget.time,
        style: small,
      );
    }
  }

  Widget _renderSubtitle(BuildContext context) {
    switch (widget.type) {
      case "text":
        return RichText(
          softWrap: false,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          strutStyle: StrutStyle(fontSize: 12.0),
          text: TextSpan(
              style: TextStyle(color: Colors.black),
              text: "${widget.lastMessage}"),
        );
        break;
      default:
        return Text("no message");
    }
  }
}
