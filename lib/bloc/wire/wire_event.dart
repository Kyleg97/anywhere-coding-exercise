part of 'wire_bloc.dart';

sealed class WireEvent extends Equatable {
  const WireEvent();
}

final class LoadWireCharacters extends WireEvent {
  @override
  List<Object?> get props => [];
}
