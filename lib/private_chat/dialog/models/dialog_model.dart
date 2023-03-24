class DialogModel {
  int? count;

  List<Results>? results;

  DialogModel({this.count, this.results});

  DialogModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];

    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;

    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? created;
  String? modified;
  LastMsg? lastMsg;
  int? unreadMsgCount;
  ChaterProfile? chaterProfile;

  Results(
      {this.id,
      this.created,
      this.modified,
      this.lastMsg,
      this.unreadMsgCount,
      this.chaterProfile});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    modified = json['modified'];
    lastMsg =
        json['last_msg'] != null ? LastMsg.fromJson(json['last_msg']) : null;
    unreadMsgCount = json['unread_msg_count'];
    chaterProfile = json['chater_profile'] != null
        ? ChaterProfile.fromJson(json['chater_profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created'] = created;
    data['modified'] = modified;
    if (lastMsg != null) {
      data['last_msg'] = lastMsg!.toJson();
    }
    data['unread_msg_count'] = unreadMsgCount;
    if (chaterProfile != null) {
      data['chater_profile'] = chaterProfile!.toJson();
    }
    return data;
  }
}

class LastMsg {
  int? id;
  String? text;
  String? created;
  String? modified;
  bool? read;
  int? sender;
  int? recipient;

  LastMsg(
      {this.id,
      this.text,
      this.created,
      this.modified,
      this.read,
      this.sender,
      this.recipient});

  LastMsg.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    created = json['created'];
    modified = json['modified'];
    read = json['read'];
    sender = json['sender'];
    recipient = json['recipient'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['created'] = created;
    data['modified'] = modified;
    data['read'] = read;
    data['sender'] = sender;
    data['recipient'] = recipient;
    return data;
  }
}

class ChaterProfile {
  int? id;
  int? user;
  String? image;
  String? userName;
  String? email;

  ChaterProfile({this.id, this.user, this.image, this.userName, this.email});

  ChaterProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    image = json['image'];
    userName = json['user_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user'] = user;
    data['image'] = image;
    data['user_name'] = userName;
    data['email'] = email;
    return data;
  }
}
