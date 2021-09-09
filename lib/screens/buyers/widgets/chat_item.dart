import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shop_app/screens/buyers/chat/chat_section_screen.dart';

enum MessageType { normal, photo, video, document, contact }

class ChatItem extends StatefulWidget {
  final String name;
  final int count;
  final String text;
  final String time;
  final String lastMessage;
  final String friendId;
  final String color;

  ChatItem({@required this.name, this.friendId, @required this.count, this.text, this.lastMessage, @required this.time, @required this.color});

  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  TextStyle media = TextStyle(fontSize: 14);
  TextStyle small = TextStyle(fontSize: 10);
  double iconSize = 18;
  String token = null;

  @override
  void initState() {
    print("friend Id ${widget.friendId}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        onTap: () => {
          Navigator.pushNamed(
            context,
            ChatSectionScreen.routeName,
            arguments: ChatSectionScreen(
              fname: widget.name,
              id: widget.friendId,
            ),
          )
        },
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage("assets/images/user.png"),
        ),
        title: Text(
          "${widget.name}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: _renderSubtitle(context),
        trailing: _renderTailing(context),
      ),
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
    initializeDateFormatting();
    String languageCode = Localizations.localeOf(context).languageCode;
    String dateTime = DateFormat("HH:mm", languageCode).format(DateTime.parse(widget.time));
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
        dateTime,
        style: small,
      );
    }
  }

  Widget _renderSubtitle(BuildContext context) {
    return RichText(
      softWrap: false,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      strutStyle: StrutStyle(fontSize: 12.0),
      text: TextSpan(style: TextStyle(color: Colors.black), text: "${widget.lastMessage}"),
    );
  }
}
