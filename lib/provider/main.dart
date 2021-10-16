import 'package:template/config/themes/themesData.dart';

import './api/projects.dart';
import './baseVar.dart';
import 'package:provider/provider.dart';

import 'api/tasks.dart';
import 'api/users.dart';
import 'homeProvider.dart';


   List<ChangeNotifierProvider> providerList = [
    ChangeNotifierProvider(create: (_) => HomeP()),
     ChangeNotifierProvider(create: (_) => BaseVar()),
     ChangeNotifierProvider(create: (_) => TasksP()),
     ChangeNotifierProvider(create: (_) => UsersP()),
     ChangeNotifierProvider(create: (_) => ThemeStore()),
  ];
