import 'package:anywhere_coding_exercise/bloc/wire/wire_bloc.dart';
import 'package:anywhere_coding_exercise/components/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VariantTwo extends StatelessWidget {
  const VariantTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        title: "The Wire Character Viewer",
        child: BlocBuilder<WireBloc, WireState>(
          builder: (context, state) {
            if (state is WireInitial) {
              return const Center(child: Text("Initial state"));
            } else if (state is WireLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WireLoadingFailed) {
              // TODO: Allow for retry
              return Center(
                child: Text(
                  "Failed to load simpsons characters: ${state.error.description}",
                ),
              );
            } else if (state is WireLoaded) {
              return _buildLoadedWireWidget();
            } else {
              return const Center(
                child: Text("Something went wrong."),
              );
            }
          },
        ));
  }

  Widget _buildLoadedWireWidget() {
    return Container();
  }
}
