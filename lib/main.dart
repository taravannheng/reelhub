import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:reelhub/app.dart';
import 'package:reelhub/config/di.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await initDI();
  runApp(const ReelHub());
}
