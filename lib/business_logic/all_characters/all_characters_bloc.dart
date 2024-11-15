// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_app/data/model/character.dart';
import 'package:naruto_app/data/repository/database_repository.dart';

part 'all_characters_event.dart';
part 'all_characters_state.dart';


class AllCharactersBloc extends Bloc<AllCharactersEvent, AllCharactersState> {

  final DatabaseRepository _databaseRepository;

  AllCharactersBloc(this._databaseRepository) : super(const AllCharactersInitial([])) {
    on<AllCharactersFetched>(
        _onFetched,
        transformer: droppable()
    );
  }

  Future<void> _onFetched(AllCharactersFetched event, Emitter<AllCharactersState> emit) async {
    if(state.hasReachedMax ?? false) return;
    emit(state is AllCharactersInitial ? const AllCharactersLoad() : AllCharactersPaging(state.characters??[]));
    try {
      List<Character>? characters = await _databaseRepository.getItemsPaginated("characters", state.characters!.length, Character.fromMap);
      emit(characters!.isEmpty ? AllCharactersSuccess(state.characters!, true) : AllCharactersSuccess([...?state.characters, ...characters], false));
    }
    catch (err) {
      emit(AllCharactersFailure(state.characters!, err.toString()));
    }
  }

}