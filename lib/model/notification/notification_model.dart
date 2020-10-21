class NotificationModel {
  NotificationData data;

  NotificationModel({this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new NotificationData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class NotificationData {
  String endOfListFlag;
  String totalMessageCount;
  List<MessageList> messageList;

  NotificationData(
      {this.endOfListFlag, this.totalMessageCount, this.messageList});

  NotificationData.fromJson(Map<String, dynamic> json) {
    endOfListFlag = json['endOfListFlag'];
    totalMessageCount = json['totalMessageCount'];
    if (json['messageList'] != null) {
      messageList = new List<MessageList>();
      json['messageList'].forEach((v) {
        messageList.add(new MessageList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['endOfListFlag'] = this.endOfListFlag;
    data['totalMessageCount'] = this.totalMessageCount;
    if (this.messageList != null) {
      data['messageList'] = this.messageList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MessageList {
  String sortSequence;
  int inboxId;
  String messageId;
  String category;
  String categoryColor;
  String sentTime;
  String subject;
  String body;
  String readFlag;
  List<DeeplinkList> deeplinkList;
  NotificationData data;

  MessageList(
      {this.sortSequence,
      this.inboxId,
      this.messageId,
      this.category,
      this.categoryColor,
      this.sentTime,
      this.subject,
      this.body,
      this.readFlag,
      this.deeplinkList,
      this.data});

  MessageList.fromJson(Map<String, dynamic> json) {
    sortSequence = json['sortSequence'];
    inboxId = json['inboxId'];
    messageId = json['messageId'];
    category = json['category'];
    categoryColor = json['categoryColor'];
    sentTime = json['sentTime'];
    subject = json['subject'];
    body = json['body'];
    readFlag = json['readFlag'];
    if (json['deeplinkList'] != null) {
      deeplinkList = new List<DeeplinkList>();
      json['deeplinkList'].forEach((v) {
        deeplinkList.add(new DeeplinkList.fromJson(v));
      });
    }
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sortSequence'] = this.sortSequence;
    data['inboxId'] = this.inboxId;
    data['messageId'] = this.messageId;
    data['category'] = this.category;
    data['categoryColor'] = this.categoryColor;
    data['sentTime'] = this.sentTime;
    data['subject'] = this.subject;
    data['body'] = this.body;
    data['readFlag'] = this.readFlag;
    if (this.deeplinkList != null) {
      data['deeplinkList'] = this.deeplinkList.map((v) => v.toJson()).toList();
    }
    data['data'] = this.data;
    return data;
  }
}

class DeeplinkList {
  String deeplink;
  String label;

  DeeplinkList({this.deeplink, this.label});

  DeeplinkList.fromJson(Map<String, dynamic> json) {
    deeplink = json['deeplink'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deeplink'] = this.deeplink;
    data['label'] = this.label;
    return data;
  }
}
