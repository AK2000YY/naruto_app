// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

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
