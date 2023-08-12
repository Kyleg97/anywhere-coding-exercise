import 'package:anywhere_coding_exercise/bloc/simpsons/simpsons_bloc.dart';
import 'package:anywhere_coding_exercise/components/base_screen.dart';
import 'package:anywhere_coding_exercise/models/character_model.dart'
    as character;
import 'package:anywhere_coding_exercise/screens/character_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VariantOne extends StatelessWidget {
  const VariantOne({super.key});

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
            return _buildLoadedSimpsonsWidget(
              simpsonsCharacters: state.simpsonsCharacters.relatedTopics ?? [],
            );
          } else {
            return const Center(
              child: Text("Something went wrong."),
            );
          }
        },
      ),
    );
  }

  Widget _buildLoadedSimpsonsWidget({
    required List<character.RelatedTopic> simpsonsCharacters,
  }) {
    return ListView.separated(
      itemCount: simpsonsCharacters.length,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            splashColor: Colors.purple,
            borderRadius: BorderRadius.circular(8),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => CharacterDetailScreen(
                    characterData: simpsonsCharacters[index]),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      simpsonsCharacters[index].getCharacterName() ??
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
