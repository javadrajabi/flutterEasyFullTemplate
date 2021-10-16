import '../../../models/login/AllTasks.dart';
import '../../../models/projects/Projects.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:typed_data';
import '../../data/webService/httpRequest.dart';

class TasksP with ChangeNotifier {


  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

// pointer

}