part of 'characters_bloc.dart';

sealed class CharactersState extends Equatable {
  const CharactersState();
}

final class CharactersInitial extends CharactersState {
  const CharactersInitial();

  @override
  List<Object> get props => [];
}

class CharactersLoading extends CharactersState {
  const CharactersLoading();

  @override
  List<Object> get props => [];
}

class CharactersLoadingFailed extends CharactersState {
  final Failure error;
  const CharactersLoadingFailed(this.error);

  @override
  List<Object?> get props => [error];
}

class CharactersLoaded extends CharactersState {
  final CharacterInfo characters;
  const CharactersLoaded({required this.characters});

  @override
  List<Object?> get props => [characters];
}
