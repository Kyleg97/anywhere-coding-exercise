import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wire_event.dart';
part 'wire_state.dart';

class WireBloc extends Bloc<WireEvent, WireState> {
  WireBloc() : super(WireInitial()) {
    on<WireEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
