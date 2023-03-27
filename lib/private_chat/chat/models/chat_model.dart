class ChatModel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  ChatModel({this.count, this.next, this.previous, this.results});

  ChatModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
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
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  // ignore: non_constant_identifier_names
  int? msg_type;
  String? text;
  String? created;
  String? modified;
  bool? read;
  FileMap? file;
  int? sender;
  int? recipient;

  int? dbId;
  // ignore: non_constant_identifier_names
  int? uploaded_by;

  String? fileName;

  Results({
    // ignore: non_constant_identifier_names
    this.msg_type,
    this.id,
    this.text,
    this.created,
    this.modified,
    this.read,
    this.file,
    this.sender,
    this.recipient,
    this.dbId,
    this.fileName,
    // ignore: non_constant_identifier_names
    this.uploaded_by,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    msg_type = json['msg_type'];
    text = json['text'];
    created = json['created'];
    modified = json['modified'];
    read = json['read'];
    file = json['file'] != null ? FileMap.fromJson(json['file']) : null;
    sender =
        json['sender'] is String ? int.parse(json['sender']) : json['sender'];

    dbId = json['dbId'];
    fileName = json['fileName'];
    recipient = json['recipient'];
    uploaded_by = json['uploaded_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['msg_type'] = msg_type;
    data['text'] = text;
    data['created'] = created;
    data['modified'] = modified;
    data['read'] = read;
    if (file != null) {
      data['media'] = file!.toJson();
    }
    data['sender'] = sender;

    data['dbId'] = dbId;
    data['fileName'] = fileName;
    data['uploaded_by'] = uploaded_by;
    return data;
  }
}

class FileMap {
  int? id;
  int? uploadedBy;
  String? file;
  String? uploadDate;

  FileMap({this.id, this.uploadedBy, this.file, this.uploadDate});

  FileMap.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uploadedBy = json['uploaded_by'];
    file = json['file'];
    uploadDate = json['upload_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uploaded_by'] = uploadedBy;
    data['file'] = file;
    data['upload_date'] = uploadDate;
    return data;
  }
}
