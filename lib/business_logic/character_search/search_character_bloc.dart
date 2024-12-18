// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

import 'dart:math';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_app/core/classes/edit_distance.dart';
import 'package:naruto_app/data/model/character.dart';
import 'package:naruto_app/data/repository/database_repository.dart';

part 'search_character_event.dart';
part 'search_character_state.dart';

class SearchCharacterBloc extends Bloc<SearchCharacterEvent, SearchCharacterState> {

  final DatabaseRepository _databaseRepository;
  List<Character>? _characters;

  SearchCharacterBloc(this._databaseRepository) : super(const SearchCharacterInitial()) {
    on<SearchCharacterEvent>((event, emit) {
      on<SearchCharacterStarted>(
        _onStart,
        transformer: restartable()
      );
    });
  }

  _onStart(SearchCharacterStarted event, Emitter<SearchCharacterState> emit) async {
    emit(SearchCharacterLoading(state.characters));
    await _initializeCharacters();
    List<MapEntry<int, Character>> searchResults = [];
    _characters?.forEach((character) {
      EditDistance editDistance = EditDistance(event.characterName.toLowerCase(), character.name!.toLowerCase().substring(0, min(event.characterName.length - 1 , character.name!.toLowerCase().length - 1)));
      int priority = editDistance.calc(0, 0);
      searchResults.add(MapEntry(priority, character));
    });
    emit(SearchCharacterSuccess(_getSortedValueByKey(searchResults).sublist(0, 10)));
  }

  _initializeCharacters() async {
    _characters = _characters ?? await _databaseRepository.getData<Character>("characters", Character.fromMap);
  }

  List<Character> _getSortedValueByKey(List<MapEntry<int, Character>> searchResults) {
    searchResults.sort((a, b) => a.key.compareTo(b.key));
    return searchResults.map((element) => element.value).toList();
  }

}
