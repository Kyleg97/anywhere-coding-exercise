import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wire_bloc_event.dart';
part 'wire_bloc_state.dart';

class WireBlocBloc extends Bloc<WireBlocEvent, WireBlocState> {
  WireBlocBloc() : super(WireBlocInitial()) {
    on<WireBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
