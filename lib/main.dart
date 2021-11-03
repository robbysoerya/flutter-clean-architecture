import 'package:flutter/material.dart';
import 'package:portfolio/src/core/utils/sharedpref.dart';

import 'src/app.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SharedPref().init();
  runApp(const MyApp());
}
