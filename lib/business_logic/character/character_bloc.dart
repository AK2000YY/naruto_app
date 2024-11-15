// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_app/data/model/character.dart';
import 'package:naruto_app/data/repository/all_characters_repository.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {

  final AllCharactersRepository _allCharactersRepository;

  CharacterBloc(this._allCharactersRepository) : super(const CharacterInitial()) {
    on<CharacterFetched>(
        _onFetched,
        transformer: restartable()
    );
  }

  _onFetched(CharacterFetched event, Emitter<CharacterState> emit) async {
    emit(const CharacterLoading());
    try {
      Character character = await _allCharactersRepository.getCharacter(event.id);
      emit(CharacterSuccess(character));
    } catch(err) {
      emit(CharacterFailure(err.toString()));
    }

  }
}
