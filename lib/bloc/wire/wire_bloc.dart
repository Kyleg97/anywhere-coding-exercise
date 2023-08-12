import 'package:anywhere_coding_exercise/api/characters_api.dart';
import 'package:anywhere_coding_exercise/api/result.dart';
import 'package:anywhere_coding_exercise/models/character_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wire_event.dart';
part 'wire_state.dart';

class WireBloc extends Bloc<WireEvent, WireState> {
  WireBloc() : super(WireInitial()) {
    on<LoadWireCharacters>((event, emit) async {
      emit(const WireLoading());
      await CharactersApi().getWireCharacters().then(
        (result) {
          if (result is Success) {
            emit(WireLoaded(wireCharacters: result.value as CharacterInfo));
          } else if (result is Failure) {
            emit(WireLoadingFailed(error: result));
          }
        },
      );
    });
  }
}
