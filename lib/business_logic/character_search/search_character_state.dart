part of 'search_character_bloc.dart';

sealed class SearchCharacterState extends Equatable {

  final List<Character> characters;

  const SearchCharacterState(this.characters);

  @override
  List<Object?> get props => [characters];
}

final class SearchCharacterInitial extends SearchCharacterState {
  const SearchCharacterInitial() : super(const []);
}

final class SearchCharacterSuccess extends SearchCharacterState {
  const SearchCharacterSuccess(super.characters);
}