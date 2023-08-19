import 'package:anywhere_coding_exercise/components/base_screen.dart';
import 'package:anywhere_coding_exercise/models/character_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({
    super.key,
    required this.characterData,
    required this.appBar,
  });

  final RelatedTopic characterData;
  final bool appBar;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: appBar == true ? "Character Details" : null,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              characterData.icon!.getUrlPath() == null
                  ? SizedBox.square(
                      dimension: 200,
                      child: Image.asset("assets/placeholder.png"),
                    )
                  : SizedBox.square(
                      dimension: 200,
                      child: CachedNetworkImage(
                        imageUrl: characterData.icon!.getUrlPath()!,
                        placeholder: (context, url) => const SizedBox.square(
                          dimension: 25,
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/placeholder.png"),
                      ),
                    ),
              const SizedBox(height: 10),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        characterData.getCharacterName() ?? "Name Unavailable",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        characterData.getSimplifiedDescription() ??
                            "No description available",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
