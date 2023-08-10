import 'package:anywhere_coding_exercise/components/base_screen.dart';
import 'package:anywhere_coding_exercise/models/character_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({super.key, required this.characterData});

  final RelatedTopic characterData;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        title: "Character Detail Screen",
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              characterData.icon!.getUrlPath() == null
                  ? SizedBox.square(
                      dimension: 150,
                      child: Image.asset("assets/placeholder.png"),
                    )
                  : SizedBox.square(
                      dimension: 150,
                      child: Image.network(
                        characterData.icon!.getUrlPath()!,
                        // placeholder: (context, url) =>
                        // const CircularProgressIndicator(),
                        // errorWidget: (context, url, error) =>
                        // Image.asset("assets/placeholder.png"),
                      ),
                    ),
              const SizedBox(height: 10),
              Text(
                characterData.getCharacterName() ?? "Name Unavailable",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                characterData.getSimplifiedDesceription() ??
                    "No description available",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
