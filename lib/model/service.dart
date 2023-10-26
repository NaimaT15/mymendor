import 'dart:convert';

List<Service> modelServiceFromJson(String str) =>
    List<Service>.from(json.decode(str).map((x) => Service.fromJson(x)));

class Service {
  final String name;
  final int ID;

  Service({required this.name, required this.ID});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'ID': ID,
    };
  }

  factory Service.fromJson(Map<dynamic, dynamic> json) => Service(
        ID: json["ID"],
        name: json["name"],
      );
}
