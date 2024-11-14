part of 'character_bloc.dart';

sealed class CharacterState extends Equatable {

  final Character? character;
  final String? error;

  const CharacterState(this.character, this.error);

  @override
  List<Object?> get props => throw UnimplementedError();
}

final class CharacterInitial extends CharacterState {
  const CharacterInitial() : super(null, null);
}

final class CharacterLoading extends CharacterState {
  const CharacterLoading() : super(null, null);
}

final class CharacterSuccess extends CharacterState {
  const CharacterSuccess(Character character) : super(character, null);
}

final class CharacterFailure extends CharacterState {
  const CharacterFailure(String error) : super(null, error);
}

