// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

part of 'search_character_bloc.dart';

sealed class SearchCharacterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SearchCharacterStarted extends SearchCharacterEvent {

  final String characterName;

  SearchCharacterStarted(this.characterName);
}
