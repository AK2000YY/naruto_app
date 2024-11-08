import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_app/data/model/character.dart';
import 'package:naruto_app/data/repository/all_characters_repository.dart';

part 'all_characters_event.dart';
part 'all_characters_state.dart';


class AllCharactersBloc extends Bloc<AllCharactersEvent, AllCharactersState> {

  final AllCharactersRepository _charactersRepository;

  AllCharactersBloc(this._charactersRepository) : super(const AllCharactersInitial([])) {
    on<AllCharactersFetched>(
        _onFetched,
        transformer: droppable()
    );
  }

  Future<void> _onFetched(AllCharactersFetched event, Emitter<AllCharactersState> emit) async {
    print("AK2000YY EVENT \n");
    if(state.hasReachedMax ?? false) return;
    emit(state is AllCharactersInitial ? const AllCharactersLoad() : AllCharactersPaging(state.characters??[]));
    try {
      int page = (state.characters!.length/10).floor() + 1;
      List<Character> characters = await _charactersRepository.getCharacters(page);
      emit(characters.isEmpty ? AllCharactersSuccess(state.characters!, true) : AllCharactersSuccess([...?state.characters, ...characters], false));
    } catch(err) {
      emit(AllCharactersFailure(state.characters!, err.toString()));
    }
  }

}
