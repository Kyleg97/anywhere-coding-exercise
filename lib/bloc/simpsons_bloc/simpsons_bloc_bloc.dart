import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'simpsons_bloc_event.dart';
part 'simpsons_bloc_state.dart';

class SimpsonsBlocBloc extends Bloc<SimpsonsBlocEvent, SimpsonsBlocState> {
  SimpsonsBlocBloc() : super(SimpsonsBlocInitial()) {
    on<SimpsonsBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
