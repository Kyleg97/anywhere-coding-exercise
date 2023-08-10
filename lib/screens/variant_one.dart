import 'package:anywhere_coding_exercise/bloc/simpsons/simpsons_bloc.dart';
import 'package:anywhere_coding_exercise/components/base_screen.dart';
import 'package:anywhere_coding_exercise/models/character_model.dart';
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
    required List<RelatedTopic> simpsonsCharacters,
  }) {
    return ListView.builder(
      itemCount: simpsonsCharacters.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => CharacterDetailScreen(
                    characterData: simpsonsCharacters[index]),
              )),
          child: Text(simpsonsCharacters[index].getCharacterName() ?? "no"),
        );
      },
    );
  }
}
