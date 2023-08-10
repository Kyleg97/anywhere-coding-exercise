part of 'simpsons_bloc.dart';

sealed class SimpsonsEvent extends Equatable {
  const SimpsonsEvent();
}

final class LoadSimpsonsCharacters extends SimpsonsEvent {
  @override
  List<Object?> get props => [];
}
