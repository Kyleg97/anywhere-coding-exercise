import 'package:anywhere_coding_exercise/components/base_screen.dart';
import 'package:flutter/material.dart';

class VariantOneScreen extends StatelessWidget {
  const VariantOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Simpsons Character Viewer",
      child: ListView.builder(
        itemBuilder: (context, index) {},
      ),
    );
  }
}
