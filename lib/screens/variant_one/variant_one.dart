import 'package:anywhere_coding_exercise/bloc/simpsons/simpsons_bloc.dart';
import 'package:anywhere_coding_exercise/components/base_screen.dart';
import 'package:anywhere_coding_exercise/helpers.dart';
import 'package:anywhere_coding_exercise/screens/character_detail_screen.dart';
import 'package:anywhere_coding_exercise/screens/variant_one/components/character_names_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VariantOne extends StatefulWidget {
  const VariantOne({super.key});

  @override
  State<VariantOne> createState() => _VariantOneState();
}

class _VariantOneState extends State<VariantOne> {
  int selectedCharacterIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: "Simpsons Character Viewer",
      child: BlocBuilder<SimpsonsBloc, SimpsonsState>(
        builder: (context, state) {
          if (state is SimpsonsInitial) {
            return const Center(child: Text("Initial state"));
          } else if (state is SimpsonsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SimpsonsLoadingFailed) {
            return Center(
              child: Text(
                "Failed to load simpsons characters: ${state.error.description}",
              ),
            );
          } else if (state is SimpsonsLoaded) {
            var deviceType = getDeviceType(context: context);
            return switch (deviceType) {
              DeviceType.phone => CharacterNamesList(
                  simpsonsCharacters:
                      state.simpsonsCharacters.relatedTopics ?? [],
                  deviceType: deviceType,
                ),
              DeviceType.tablet => Row(
                  children: [
                    Expanded(
                      child: CharacterNamesList(
                          simpsonsCharacters:
                              state.simpsonsCharacters.relatedTopics ?? [],
                          deviceType: deviceType,
                          onPressed: (int index) {
                            setState(() {
                              print("index: $index");
                              selectedCharacterIndex = index;
                            });
                          }),
                    ),
                    Expanded(
                      child: CharacterDetailScreen(
                        characterData: state.simpsonsCharacters
                            .relatedTopics![selectedCharacterIndex],
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
