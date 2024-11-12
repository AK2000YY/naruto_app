part of 'search_character_bloc.dart';

sealed class SearchCharacterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SearchCharacterStarted extends SearchCharacterEvent {

  final String characterName;

  SearchCharacterStarted(this.characterName);
}
