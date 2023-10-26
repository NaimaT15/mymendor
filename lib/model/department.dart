import 'dart:convert';

List<Department> modelDepartmentFromJson(String str) =>
    List<Department>.from(json.decode(str).map((x) => Department.fromJson(x)));

class Department {
  final String name;
  final int ID;

  Department({required this.name, required this.ID});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'ID': ID,
    };
  }

  factory Department.fromJson(Map<dynamic, dynamic> json) => Department(
        ID: json["ID"],
        name: json["dep_name"],
      );
}
