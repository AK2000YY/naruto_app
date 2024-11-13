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
  List<Character>? characters;

  SearchCharacterBloc(this._databaseRepository) : super(const SearchCharacterInitial()) {
    on<SearchCharacterEvent>((event, emit) {
      on<SearchCharacterStarted>(
        _onStart,
        transformer: restartable()
      );
    });
  }

  _onStart(SearchCharacterStarted event, Emitter<SearchCharacterState> emit) async {
    List<Character>? characters = await _initializeCharacters();
    List<MapEntry<int, Character>> searchResults = [];
    characters?.forEach((character) {
      EditDistance editDistance = EditDistance(event.characterName.toLowerCase(), character.name!.toLowerCase());
      int priority = editDistance.calc(0, 0);
      searchResults.add(MapEntry(priority, character));
    });
    emit(SearchCharacterSuccess(_getSortedValueByKey(searchResults)));
  }

  Future<List<Character>?> _initializeCharacters() async {
    return characters ?? await _databaseRepository.getData<Character>("characters", Character.fromMap);
  }

  List<Character> _getSortedValueByKey(List<MapEntry<int, Character>> searchResults) {
    searchResults.sort((a, b) => a.key.compareTo(b.key));
    return searchResults.map((element) => element.value).toList();
  }

}
