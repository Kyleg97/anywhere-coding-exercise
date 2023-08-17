import 'package:anywhere_coding_exercise/api/characters_api.dart';
import 'package:anywhere_coding_exercise/api/result.dart';
import 'package:anywhere_coding_exercise/models/character_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'simpsons_event.dart';
part 'simpsons_state.dart';

class SimpsonsBloc extends Bloc<SimpsonsEvent, SimpsonsState> {
  SimpsonsBloc() : super(const SimpsonsInitial()) {
    on<LoadSimpsonsCharacters>((event, emit) async {
      emit(const SimpsonsLoading());
      await CharactersApi().getSimpsonsCharacters().then(
        (result) {
          if (result is Success) {
            emit(
              SimpsonsLoaded(
                simpsonsCharacters: result.value as CharacterInfo,
              ),
            );
          } else if (result is Failure) {
            emit(SimpsonsLoadingFailed(result));
          }
        },
      );
    });
  }
}
