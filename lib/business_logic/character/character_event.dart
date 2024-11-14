part of 'character_bloc.dart';

sealed class CharacterEvent extends Equatable {

  final int id;

  const CharacterEvent(this.id);

  @override
  List<Object?> get props => [];
}

final class CharacterFetched extends CharacterEvent {
  const CharacterFetched(super.id);
}
