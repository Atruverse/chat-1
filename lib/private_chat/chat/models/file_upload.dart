class UploadModelRequest {
  String? id;
  int? uploadedBy;
  String? file;
  String? uploadDate;

  UploadModelRequest({this.id, this.uploadedBy, this.file, this.uploadDate});

  UploadModelRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
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
