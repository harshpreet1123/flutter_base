import 'package:flutter/material.dart';
import 'app.dart';
import 'services/service_locator.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await setupLocator();
  runApp(const MyApp());
}
