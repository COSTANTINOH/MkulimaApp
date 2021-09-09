class RecentChat {
  final String lastMessage;
  final String fullName;
  final String messageId;
  final Map unseen;
  final String time;
  final int friendId;

  RecentChat({
    this.messageId,
    this.unseen,
    this.time,
    this.fullName,
    this.lastMessage,
    this.friendId,
  });

  Map<String, dynamic> toMap() {
    return {
      "userId": friendId,
      "fullname": fullName,
      "color": "green",
      "lastmessage": lastMessage,
      "unseen": unseen,
      "time": time,
      "messageId":messageId
    };
  }
}
