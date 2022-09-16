import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'injection.dart';
import './presentation/core/myApp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
