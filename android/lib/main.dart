import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'homepage.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('raqba_box');
  await Hive.openBox('theme_box');
  runApp(AudioPlayerSample());
  //runApp(MyApp());
}
