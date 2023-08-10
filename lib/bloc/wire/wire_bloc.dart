import 'package:anywhere_coding_exercise/api/result.dart';
import 'package:anywhere_coding_exercise/models/character_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wire_event.dart';
part 'wire_state.dart';

class WireBloc extends Bloc<WireEvent, WireState> {
  WireBloc() : super(WireInitial()) {
    on<LoadWireCharacters>((event, emit) {
      // TODO: implement event handler
    });
  }
}
