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
  final TextEditingController controller = TextEditingController();
  late List<character.RelatedTopic> filteredCharacters;

  @override
  void initState() {
    filteredCharacters = widget.simpsonsCharacters;
    super.initState();
  }

  void _filterList() {
    filteredCharacters = widget.simpsonsCharacters
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
                controller.clear();
                filteredCharacters.clear();
                _filterList();
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
                  splashColor: Colors.purple,
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    if (widget.deviceType == DeviceType.phone) {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (_) => CharacterDetailScreen(
                              characterData: filteredCharacters[index]),
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
