import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/screens/home_screen.dart';

import 'app_theme.dart';

void main() async {
  //initialise the hive
  await Hive.initFlutter();

  final box = await Hive.openBox('mybox');



  runApp(
    // DevicePreview(builder: (context) => MyApp(),enabled: true,)
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notaria',
      theme: CustomThemeData.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}