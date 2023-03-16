class Chat {
  String? user1Id;
  String? user2Id;
  String? lastMessage;
  LastMessageTimestamp? lastMessageTimestamp;
  int? unreadCountUser1;
  int? unreadCountUser2;
  Messages? messages;

  Chat(
      {this.user1Id,
      this.user2Id,
      this.lastMessage,
      this.lastMessageTimestamp,
      this.unreadCountUser1,
      this.unreadCountUser2,
      this.messages});

  Chat.fromJson(Map<String, dynamic> json) {
    user1Id = json['user1Id'];
    user2Id = json['user2Id'];
    lastMessage = json['lastMessage'];
    lastMessageTimestamp =
        json['lastMessageTimestamp'] != null ? LastMessageTimestamp.fromJson(json['lastMessageTimestamp']) : null;
    unreadCountUser1 = json['unreadCountUser1'];
    unreadCountUser2 = json['unreadCountUser2'];
    messages = json['messages'] != null ? Messages.fromJson(json['messages']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user1Id'] = user1Id;
    data['user2Id'] = user2Id;
    data['lastMessage'] = lastMessage;
    if (lastMessageTimestamp != null) {
      data['lastMessageTimestamp'] = lastMessageTimestamp!.toJson();
    }
    data['unreadCountUser1'] = unreadCountUser1;
    data['unreadCountUser2'] = unreadCountUser2;
    if (messages != null) {
      data['messages'] = messages!.toJson();
    }
    return data;
  }
}

class LastMessageTimestamp {
  int? iSeconds;
  int? iNanoseconds;

  LastMessageTimestamp({this.iSeconds, this.iNanoseconds});

  LastMessageTimestamp.fromJson(Map<String, dynamic> json) {
    iSeconds = json['_seconds'];
    iNanoseconds = json['_nanoseconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_seconds'] = iSeconds;
    data['_nanoseconds'] = iNanoseconds;
    return data;
  }
}

class Messages {
  MessageId1? messageId1;
  MessageId1? messageId2;

  Messages({this.messageId1, this.messageId2});

  Messages.fromJson(Map<String, dynamic> json) {
    messageId1 = json['messageId1'] != null ? MessageId1.fromJson(json['messageId1']) : null;
    messageId2 = json['messageId2'] != null ? MessageId1.fromJson(json['messageId2']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (messageId1 != null) {
      data['messageId1'] = messageId1!.toJson();
    }
    if (messageId2 != null) {
      data['messageId2'] = messageId2!.toJson();
    }
    return data;
  }
}

class MessageId1 {
  String? senderId;
  String? text;
  LastMessageTimestamp? timestamp;

  MessageId1({this.senderId, this.text, this.timestamp});

  MessageId1.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    text = json['text'];
    timestamp = json['timestamp'] != null ? LastMessageTimestamp.fromJson(json['timestamp']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['senderId'] = senderId;
    data['text'] = text;
    if (timestamp != null) {
      data['timestamp'] = timestamp!.toJson();
    }
    return data;
  }
}
