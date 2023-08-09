import 'package:anywhere_coding_exercise/bloc/simpsons/simpsons_bloc.dart';
import 'package:anywhere_coding_exercise/components/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VariantOneScreen extends StatelessWidget {
  const VariantOneScreen({super.key});

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
            return _buildLoadedSimpsonsWidget();
          } else {
            return const Center(
              child: Text("Something went wrong."),
            );
          }
        },
      ),
    );
  }

  Widget _buildLoadedSimpsonsWidget() {
    return ListView.builder(
      itemBuilder: (context, index) {},
    );
  }
}
