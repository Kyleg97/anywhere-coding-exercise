import 'package:anywhere_coding_exercise/bloc/characters/characters_bloc.dart';
import 'package:anywhere_coding_exercise/screens/components/base_screen.dart';
import 'package:anywhere_coding_exercise/flavors.dart';
import 'package:anywhere_coding_exercise/helpers.dart';
import 'package:anywhere_coding_exercise/screens/components/character_detail_screen.dart';
import 'package:anywhere_coding_exercise/screens/components/character_names_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCharacterIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "${F.title} Character Viewer",
      child: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          if (state is CharactersInitial) {
            return const Center(child: Text("Initial state"));
          } else if (state is CharactersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharactersLoadingFailed) {
            return Center(
              child: Text(
                "Failed to load characters: ${state.error.description}",
              ),
            );
          } else if (state is CharactersLoaded) {
            var deviceType = getDeviceType(context: context);
            return switch (deviceType) {
              DeviceType.phone => CharacterNamesList(
                  characters: state.characters.relatedTopics ?? [],
                  deviceType: deviceType,
                ),
              DeviceType.tablet => Row(
                  children: [
                    Expanded(
                      child: CharacterNamesList(
                          characters: state.characters.relatedTopics ?? [],
                          deviceType: deviceType,
                          onPressed: (int index) {
                            setState(() {
                              selectedCharacterIndex = index;
                            });
                          }),
                    ),
                    Expanded(
                      child: CharacterDetailScreen(
                        characterData: state
                            .characters.relatedTopics![selectedCharacterIndex],
                        appBar: false,
                      ),
                    ),
                  ],
                ),
            };
          } else {
            return const Center(
              child: Text("Something went wrong."),
            );
          }
        },
      ),
    );
  }
}
