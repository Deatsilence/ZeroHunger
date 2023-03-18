import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable()
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

  factory Chat.fromJson(Map<String, dynamic> json) {
    return _$ChatFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ChatToJson(this);
  }
}

@JsonSerializable()
class LastMessageTimestamp {
  int? iSeconds;
  int? iNanoseconds;

  LastMessageTimestamp({this.iSeconds, this.iNanoseconds});

  factory LastMessageTimestamp.fromJson(Map<String, dynamic> json) {
    return _$LastMessageTimestampFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LastMessageTimestampToJson(this);
  }
}

@JsonSerializable()
class Messages {
  MessageId1? messageId1;
  MessageId1? messageId2;

  Messages({this.messageId1, this.messageId2});

  factory Messages.fromJson(Map<String, dynamic> json) {
    return _$MessagesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MessagesToJson(this);
  }
}

@JsonSerializable()
class MessageId1 {
  String? senderId;
  String? text;
  LastMessageTimestamp? timestamp;

  MessageId1({this.senderId, this.text, this.timestamp});

  factory MessageId1.fromJson(Map<String, dynamic> json) {
    return _$MessageId1FromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MessageId1ToJson(this);
  }
}
