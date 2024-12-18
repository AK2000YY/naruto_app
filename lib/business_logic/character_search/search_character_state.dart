// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

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

final class SearchCharacterLoading extends SearchCharacterState {
  const SearchCharacterLoading(super.characters);
}

final class SearchCharacterSuccess extends SearchCharacterState {
  const SearchCharacterSuccess(super.characters);
}