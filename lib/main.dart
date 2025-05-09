import 'package:flutter/material.dart';
import 'package:flutter_project_getx/app.dart';
import 'package:flutter_project_getx/core/service/local_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.instance.init();
  runApp(const MyApp());
}
