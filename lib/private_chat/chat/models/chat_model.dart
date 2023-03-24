class ChatModel {
  int? count;
  String? next;

  List<Results>? results;

  ChatModel({this.count, this.next, this.results});

  ChatModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];

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
    data['next'] = next;

    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? text;
  String? created;
  String? modified;
  bool? read;
  int? sender;
  int? recipient;

  Results(
      {this.id,
      this.text,
      this.created,
      this.modified,
      this.read,
      this.sender,
      this.recipient});

  Results.fromJson(Map<String, dynamic> json) {
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
