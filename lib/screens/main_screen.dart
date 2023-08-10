import 'package:anywhere_coding_exercise/screens/variant_one.dart';
import 'package:anywhere_coding_exercise/screens/variant_two.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // placeholder for flavors?
      body: VariantOne(),
    );
  }
}
