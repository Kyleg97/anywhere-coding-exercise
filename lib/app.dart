import 'package:anywhere_coding_exercise/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'flavors.dart';

class AnywhereApp extends StatelessWidget {
  const AnywhereApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: F.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
