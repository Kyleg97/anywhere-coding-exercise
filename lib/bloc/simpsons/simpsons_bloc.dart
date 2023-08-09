import 'package:anywhere_coding_exercise/api/result.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'simpsons_event.dart';
part 'simpsons_state.dart';

class SimpsonsBloc extends Bloc<SimpsonsEvent, SimpsonsState> {
  SimpsonsBloc() : super(const SimpsonsInitial()) {
    on<LoadSimpsonsCharacter>((event, emit) {
      // TODO: implement event handler
    });
  }
}
