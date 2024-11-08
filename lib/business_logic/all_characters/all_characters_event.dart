part of 'all_characters_bloc.dart';


sealed class AllCharactersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AllCharactersFetched extends AllCharactersEvent {}
