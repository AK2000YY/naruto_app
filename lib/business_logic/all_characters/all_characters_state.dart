part of 'all_characters_bloc.dart';

sealed class AllCharactersState extends Equatable {
  final List<Character>? characters;
  final bool? hasReachedMax;
  final String? error;

  const AllCharactersState({this.characters, this.hasReachedMax,this.error});

  @override
  List<Object?> get props => [characters, hasReachedMax];
}

final class AllCharactersInitial extends AllCharactersState {
  const AllCharactersInitial(List<Character> characters): super(characters: characters, hasReachedMax: false);
}

final class AllCharactersLoaded extends AllCharactersState {
  const AllCharactersLoaded(List<Character> characters): super(characters: characters, hasReachedMax: false);
}

final class AllCharactersSuccess extends AllCharactersState {
  const AllCharactersSuccess(List<Character> characters, bool hasReachedMax): super(characters: characters, hasReachedMax: hasReachedMax);
}

final class AllCharactersFailure extends AllCharactersState {
  const AllCharactersFailure(List<Character> characters, String error): super(characters: characters, hasReachedMax: false, error: error);
}
