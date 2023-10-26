import 'dart:convert';

List<AnnouncementModel> modelAnnouncementModelFromJson(String str) =>
    List<AnnouncementModel>.from(
        json.decode(str).map((x) => AnnouncementModel.fromJson(x)));

class AnnouncementModel {
  final String title;
  final int ID;
  final String description;
  final String dateCreated;
  final int depId;

  AnnouncementModel(
      {required this.title,
      required this.ID,
      required this.description,
      required this.dateCreated,
      required this.depId});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'dateCreated': dateCreated,
      'depId': depId,
      'ID': ID,
    };
  }

  factory AnnouncementModel.fromJson(Map<dynamic, dynamic> json) =>
      AnnouncementModel(
        ID: json["ID"],
        title: json["title"],
        description: json["description"],
        dateCreated: json["date_created"],
        depId: json["dep_ID"],
      );
}
