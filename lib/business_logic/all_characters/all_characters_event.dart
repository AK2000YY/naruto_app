// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

part of 'all_characters_bloc.dart';


sealed class AllCharactersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AllCharactersFetched extends AllCharactersEvent {}
