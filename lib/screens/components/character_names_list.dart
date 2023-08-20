import 'package:anywhere_coding_exercise/helpers.dart';
import 'package:anywhere_coding_exercise/models/character_model.dart'
    as character;
import 'package:anywhere_coding_exercise/screens/components/character_detail_screen.dart';
import 'package:flutter/material.dart';

class CharacterNamesList extends StatefulWidget {
  const CharacterNamesList({
    super.key,
    required this.characters,
    required this.deviceType,
    this.onPressed,
  });

  final List<character.RelatedTopic> characters;
  final DeviceType deviceType;
  final Function(int)? onPressed;

  @override
  State<CharacterNamesList> createState() => _CharacterNamesListState();
}

class _CharacterNamesListState extends State<CharacterNamesList> {
  final TextEditingController controller = TextEditingController();
  late List<character.RelatedTopic> filteredCharacters;

  @override
  void initState() {
    filteredCharacters = widget.characters;
    super.initState();
  }

  void _filterList() {
    filteredCharacters = widget.characters
        .where((character) => character
            .getCharacterName()!
            .toLowerCase()
            .contains(controller.text.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.search),
          title: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
            ),
            onChanged: (String text) {
              setState(() {
                _filterList();
              });
            },
          ),
          trailing: IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                FocusManager.instance.primaryFocus?.unfocus();
                controller.clear();
                filteredCharacters = widget.characters;
              });
            },
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: filteredCharacters.length,
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    if (widget.deviceType == DeviceType.phone) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (_) => CharacterDetailScreen(
                            characterData: filteredCharacters[index],
                            appBar: true,
                          ),
                        ),
                      );
                    } else if (widget.deviceType == DeviceType.tablet) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      int adjustedIndex = widget.characters.indexWhere(
                          (element) =>
                              filteredCharacters[index].getCharacterName() ==
                              element.getCharacterName());
                      widget.onPressed!(adjustedIndex);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            filteredCharacters[index].getCharacterName() ??
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
          ),
        ),
      ],
    );
  }
}
