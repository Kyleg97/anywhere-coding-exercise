part of 'wire_bloc.dart';

sealed class WireState extends Equatable {
  const WireState();
}

final class WireInitial extends WireState {
  const WireInitial();

  @override
  List<Object> get props => [];
}

class WireLoading extends WireState {
  const WireLoading();

  @override
  List<Object> get props => [];
}

class WireLoadingFailed extends WireState {
  final Failure error;
  const WireLoadingFailed({required this.error});

  @override
  List<Object?> get props => [error];
}

class WireLoaded extends WireState {
  final CharacterInfo wireCharacters; // placeholder until we create model
  const WireLoaded({required this.wireCharacters});

  @override
  List<Object?> get props => [wireCharacters];
}
