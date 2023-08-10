import 'package:anywhere_coding_exercise/components/base_screen.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Character Detail Screen",
      child: Container(
        child: Text("Character Detail Screen..."),
      ),
    );
  }
}
