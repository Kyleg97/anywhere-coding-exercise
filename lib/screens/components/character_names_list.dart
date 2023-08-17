import 'package:anywhere_coding_exercise/helpers.dart';
import 'package:anywhere_coding_exercise/models/character_model.dart'
    as character;
import 'package:anywhere_coding_exercise/screens/components/character_detail_screen.dart';
import 'package:flutter/material.dart';

class CharacterNamesList extends StatefulWidget {
  const CharacterNamesList({
    super.key,
    required this.simpsonsCharacters,
    required this.deviceType,
    this.onPressed,
  });

  final List<character.RelatedTopic> simpsonsCharacters;
  final DeviceType deviceType;
  final Function(int)? onPressed;

  @override
  State<CharacterNamesList> createState() => _CharacterNamesListState();
}

class _CharacterNamesListState extends State<CharacterNamesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.simpsonsCharacters.length,
      padding: const EdgeInsets.all(10),
      // shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            splashColor: Colors.purple,
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              if (widget.deviceType == DeviceType.phone) {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => CharacterDetailScreen(
                        characterData: widget.simpsonsCharacters[index]),
                  ),
                );
              } else if (widget.deviceType == DeviceType.tablet) {
                widget.onPressed!(index);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.simpsonsCharacters[index].getCharacterName() ??
                          "No character name",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_right, size: 20),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 5);
      },
    );
  }
}
