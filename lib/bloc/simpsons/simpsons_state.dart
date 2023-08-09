part of 'simpsons_bloc.dart';

sealed class SimpsonsState extends Equatable {
  const SimpsonsState();
}

final class SimpsonsInitial extends SimpsonsState {
  const SimpsonsInitial();

  @override
  List<Object> get props => [];
}

class SimpsonsLoading extends SimpsonsState {
  const SimpsonsLoading();

  @override
  List<Object> get props => [];
}

class SimpsonsLoadingFailed extends SimpsonsState {
  final Failure error;
  const SimpsonsLoadingFailed({required this.error});

  @override
  List<Object?> get props => [error];
}

class SimpsonsLoaded extends SimpsonsState {
  final List<String> simpsonsCharacters; // placeholder until we create model
  const SimpsonsLoaded({required this.simpsonsCharacters});

  @override
  List<Object?> get props => [simpsonsCharacters];
}
