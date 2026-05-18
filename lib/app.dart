import 'package:flutter/material.dart';

import 'screen/drawer.dart';
import 'screen/home_screen_practice.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenPractice(),
    );
  }
}
