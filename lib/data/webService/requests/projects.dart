import '../../../models/projects/Projects.dart';
import 'package:flutter/cupertino.dart';
import '../httpRequest.dart';

class ApiProjects {
  ApiProjects._();

  static Future doneTask(id,int doneMinutes) async {
    String url =  "/me.doneTask";
    Map? res = await HttpRequest.post(path: url, body: {'done_minutes':doneMinutes ,'id':id});
  }

  static Future getProjects() async {
    String url =  "/me.getProjects";
    Map? res = await HttpRequest.get(path: url,withToken: true);
    return res;
  }

  static Future createProject({@required name,@required comment}) async {
    String url =  "/project.createProject";
    Map? res = await HttpRequest.post(path: url,body:{
      "name":name,
      "comment":comment
    },withToken: true);
    return res;
  }
  static Future<Projects> getAdminProjects() async {
    String url = "/project.getProjects";
    Map? res = await HttpRequest.post(path: url, body: {}, withToken: true);
    return Projects.fromJson(res!);
  }

}