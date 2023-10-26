import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:mymendorr/handler/api_filehandler.dart';
import 'package:mymendorr/model/announcement.dart';
import 'package:mymendorr/model/department.dart';
import 'package:mymendorr/model/service.dart';
import 'package:http/http.dart' as http;

bool isUserLoggedIn() {
  final LocalStorage storage = LocalStorage('user-store');
  var getUser = storage.getItem('user') ?? [];
  var token = storage.getItem('token') ?? [];
  if (getUser.length == 0 && token.length == 0) {
    return false;
  } else {
    return true;
  }
}

logout() {
  final LocalStorage storage = LocalStorage('user-store');
  storage.setItem('user', []);
  storage.setItem('token', []);
}

saveTokenToStorage(tokenString) {
  final LocalStorage storage = LocalStorage('user-store');
  storage.setItem('token', jsonEncode(tokenString));
}

readTokenFromStorage() {
  final LocalStorage storage = LocalStorage('user-store');
  var token = storage.getItem('token') ?? [];
  return token;
}

saveServiceListToLocalStorage() async {
  List<Service> listModel = [];
  final responseData = await http
      .get(Uri.parse("http://127.0.0.1:8000/api/services/service_list/"));
  if (responseData.statusCode == 200) {
    final data = jsonDecode(responseData.body);
    for (Map i in data) {
      listModel.add(Service.fromJson(i));
    }
    print(listModel.map((object) => object.toJson()).toList());
    String jsonString =
        json.encode(listModel.map((object) => object.toJson()).toList());

    final LocalStorage storage = LocalStorage('user-store');
    storage.setItem('services', jsonString);
  } else {
    return responseData;
  }
}

saveAnnouncementListToLocalStorage() async {
  List<AnnouncementModel> listModel = [];
  final responseData = await http
      .get(Uri.parse("http://127.0.0.1:8000/api/announce/announce_list/"));
  if (responseData.statusCode == 200) {
    final data = jsonDecode(responseData.body);
    for (Map i in data) {
      listModel.add(AnnouncementModel.fromJson(i));
    }
    print(listModel.map((object) => object.toJson()).toList());
    String jsonString =
        json.encode(listModel.map((object) => object.toJson()).toList());

    final LocalStorage storage = LocalStorage('user-store');
    storage.setItem('announcement', jsonString);
    return listModel;
  } else {
    return responseData;
  }
}

saveDepartmentListToLocalStorage() async {
  List<Department> listModel = [];
  final responseData =
      await http.get(Uri.parse("http://127.0.0.1:8000/api/auth/dep_list/"));
  print("response");
  print(responseData.toString());
  if (responseData.statusCode == 200) {
    final data = jsonDecode(responseData.body);
    print(data.toString());
    for (Map i in data) {
      listModel.add(Department.fromJson(i));
    }
    print(listModel.map((object) => object.toJson()).toList());
    String jsonString =
        json.encode(listModel.map((object) => object.toJson()).toList());

    final LocalStorage storage = LocalStorage('user-store');
    storage.setItem('departments', jsonString);
  } else {
    return responseData;
  }
}
//

void setLoggedInUser(user) {
  final LocalStorage storage = LocalStorage('user-store');
  storage.setItem('user', user);
}

getServicesFromLocalStorage() {
  final LocalStorage storage = LocalStorage('user-store');
  var services = storage.getItem('services') ?? [];
  return services;
}

getAnnouncementsFromLocalStorage() {
  final LocalStorage storage = LocalStorage('user-store');
  var services = storage.getItem('announcement') ?? [];
  return services;
}

getDepartmentFromLocalStorage() {
  final LocalStorage storage = LocalStorage('user-store');
  var departments = storage.getItem('departments') ?? [];
  return departments;
}
