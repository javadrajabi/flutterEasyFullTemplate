import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../data/webService/httpRequest.dart';

class ProjectsP with ChangeNotifier {

  Future<void> getAdminProjects() async {
    String url = "/project.getProjects";
    HttpRequest.post(path: url, body: {}, withToken: true).then((res) {
      notifyListeners();
    });
  }

  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

// pointer

}
