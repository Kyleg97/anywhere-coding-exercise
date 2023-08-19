import 'package:anywhere_coding_exercise/api/characters_api.dart';
import 'package:anywhere_coding_exercise/api/result.dart';
import 'package:anywhere_coding_exercise/helpers.dart';
import 'package:anywhere_coding_exercise/models/character_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(const CharactersInitial()) {
    on<LoadCharacters>((event, emit) async {
      emit(const CharactersLoading());
      await CharactersApi().getCharacters(url: getApiUrl()).then(
        (result) {
          if (result is Success) {
            emit(
              CharactersLoaded(
                characters: result.value as CharacterInfo,
              ),
            );
          } else if (result is Failure) {
            emit(CharactersLoadingFailed(result));
          }
        },
      );
    });
  }
}
