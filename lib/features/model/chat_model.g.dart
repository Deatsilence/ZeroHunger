// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      user1Id: json['user1Id'] as String?,
      user2Id: json['user2Id'] as String?,
      lastMessage: json['lastMessage'] as String?,
      lastMessageTimestamp: json['lastMessageTimestamp'] == null
          ? null
          : LastMessageTimestamp.fromJson(
              json['lastMessageTimestamp'] as Map<String, dynamic>),
      unreadCountUser1: json['unreadCountUser1'] as int?,
      unreadCountUser2: json['unreadCountUser2'] as int?,
      messages: json['messages'] == null
          ? null
          : Messages.fromJson(json['messages'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'user1Id': instance.user1Id,
      'user2Id': instance.user2Id,
      'lastMessage': instance.lastMessage,
      'lastMessageTimestamp': instance.lastMessageTimestamp,
      'unreadCountUser1': instance.unreadCountUser1,
      'unreadCountUser2': instance.unreadCountUser2,
      'messages': instance.messages,
    };

LastMessageTimestamp _$LastMessageTimestampFromJson(
        Map<String, dynamic> json) =>
    LastMessageTimestamp(
      iSeconds: json['iSeconds'] as int?,
      iNanoseconds: json['iNanoseconds'] as int?,
    );

Map<String, dynamic> _$LastMessageTimestampToJson(
        LastMessageTimestamp instance) =>
    <String, dynamic>{
      'iSeconds': instance.iSeconds,
      'iNanoseconds': instance.iNanoseconds,
    };

Messages _$MessagesFromJson(Map<String, dynamic> json) => Messages(
      messageId1: json['messageId1'] == null
          ? null
          : MessageId1.fromJson(json['messageId1'] as Map<String, dynamic>),
      messageId2: json['messageId2'] == null
          ? null
          : MessageId1.fromJson(json['messageId2'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessagesToJson(Messages instance) => <String, dynamic>{
      'messageId1': instance.messageId1,
      'messageId2': instance.messageId2,
    };

MessageId1 _$MessageId1FromJson(Map<String, dynamic> json) => MessageId1(
      senderId: json['senderId'] as String?,
      text: json['text'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : LastMessageTimestamp.fromJson(
              json['timestamp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageId1ToJson(MessageId1 instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'text': instance.text,
      'timestamp': instance.timestamp,
    };
