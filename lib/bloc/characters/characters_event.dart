part of 'characters_bloc.dart';

sealed class CharactersEvent extends Equatable {
  const CharactersEvent();
}

final class LoadCharacters extends CharactersEvent {
  @override
  List<Object?> get props => [];
}
