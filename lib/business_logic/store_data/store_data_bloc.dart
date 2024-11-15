// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_app/data/model/akatsuki.dart';
import 'package:naruto_app/data/model/character.dart';
import 'package:naruto_app/data/model/clan.dart';
import 'package:naruto_app/data/model/tailed_beast.dart';
import 'package:naruto_app/data/model/village.dart';
import 'package:naruto_app/data/repository/all_akatsuki_repository.dart';
import 'package:naruto_app/data/repository/all_characters_repository.dart';
import 'package:naruto_app/data/repository/all_clans_repository.dart';
import 'package:naruto_app/data/repository/all_tailed_beasts_repository.dart';
import 'package:naruto_app/data/repository/all_teams_repository.dart';
import 'package:naruto_app/data/repository/all_villages_repository.dart';
import 'package:naruto_app/data/repository/database_repository.dart';

import '../../data/model/team.dart';

part 'store_data_event.dart';
part 'store_data_state.dart';

class StoreDataBloc extends Bloc<StoreDataEvent, StoreDataState> {

  final DatabaseRepository _databaseRepository;
  final AllCharactersRepository _allCharactersRepository;
  final AllClansRepository _allClansRepository;
  final AllVillagesRepository _allVillagesRepository;
  final AllTailedBeastsRepository _allTailedBeastsRepository;
  final AllTeamsRepository _allTeamsRepository;
  final AllAkatsukiRepository _allAkatsukiRepository;
  final List<String> _tableNames = [
    'characters', 'clans', 'villages', 'tailed_beasts', 'teams', 'akatsuki'
  ];
  final List<int> _tableElementsNumber = [
    1431, 58, 39, 10, 191, 44
  ];

  StoreDataBloc(this._databaseRepository, this._allCharactersRepository, this._allClansRepository, this._allVillagesRepository, this._allTailedBeastsRepository, this._allTeamsRepository, this._allAkatsukiRepository) :super(const StoreDataInitial()) {
    on<StoreDataFetched>(_onFetched);
  }

  _onFetched(StoreDataFetched event, Emitter<StoreDataState> emit) async {
    try {
      while(!state.isComplete) {
        switch(state.tableIndex) {
          case 0: {
            List<Character>? characterListStored = await _databaseRepository.getData<Character>(_tableNames[state.tableIndex], Character.fromMap);
            while(characterListStored?.length != _tableElementsNumber[state.tableIndex]) {
              emit(StoreDataSuccess(state.tableIndex, characterListStored!.length, _tableElementsNumber[state.tableIndex], false));
              List<Character> characterListLoaded = await _allCharactersRepository.getCharacters((characterListStored.length/10).floor() + 1);
              await _databaseRepository.insertData<Character>(characterListLoaded, _tableNames[state.tableIndex], (character) => character.toMap());
              characterListStored = await _databaseRepository.getData<Character>(_tableNames[state.tableIndex], Character.fromMap);
            }
            emit(StoreDataSuccess(state.tableIndex + 1, 0, _tableElementsNumber[state.tableIndex + 1], false));
          } break;
          case 1: {
            List<Clan>? clanListStored = await _databaseRepository.getData<Clan>(_tableNames[state.tableIndex], Clan.fromMap);
            while(clanListStored?.length != _tableElementsNumber[state.tableIndex]) {
              emit(StoreDataSuccess(state.tableIndex, clanListStored!.length, _tableElementsNumber[state.tableIndex], false));
              List<Clan> clanListLoaded = await _allClansRepository.getClans((clanListStored.length/10).floor() + 1);
              await _databaseRepository.insertData<Clan>(clanListLoaded, _tableNames[state.tableIndex], (clan) => clan.toMap());
              clanListStored = await _databaseRepository.getData<Clan>(_tableNames[state.tableIndex], Clan.fromMap);
            }
            emit(StoreDataSuccess(state.tableIndex + 1, 0, _tableElementsNumber[state.tableIndex + 1], false));
          } break;
          case 2: {
            List<Village>? villageListStored = await _databaseRepository.getData<Village>(_tableNames[state.tableIndex], Village.fromMap);
            while(villageListStored?.length != _tableElementsNumber[state.tableIndex]) {
              emit(StoreDataSuccess(state.tableIndex, villageListStored!.length, _tableElementsNumber[state.tableIndex], false));
              List<Village> villageListLoaded = await _allVillagesRepository.getVillages((villageListStored.length/10).floor() + 1);
              await _databaseRepository.insertData<Village>(villageListLoaded, _tableNames[state.tableIndex], (village) => village.toMap());
              villageListStored = await _databaseRepository.getData<Village>(_tableNames[state.tableIndex], Village.fromMap);
            }
            emit(StoreDataSuccess(state.tableIndex + 1, 0, _tableElementsNumber[state.tableIndex + 1], false));
          } break;
          case 3: {
            List<TailedBeast>? tailedBeastListStored = await _databaseRepository.getData<TailedBeast>(_tableNames[state.tableIndex], TailedBeast.fromMap);
            while(tailedBeastListStored?.length != _tableElementsNumber[state.tableIndex]) {
              emit(StoreDataSuccess(state.tableIndex, tailedBeastListStored!.length, _tableElementsNumber[state.tableIndex], false));
              List<TailedBeast> tailedBeastListLoaded = await _allTailedBeastsRepository.getTailedBeasts((tailedBeastListStored.length/10).floor() + 1);
              await _databaseRepository.insertData<TailedBeast>(tailedBeastListLoaded, _tableNames[state.tableIndex], (tailedBeast) => tailedBeast.toMap());
              tailedBeastListStored = await _databaseRepository.getData<TailedBeast>(_tableNames[state.tableIndex], TailedBeast.fromMap);
            }
            emit(StoreDataSuccess(state.tableIndex + 1, 0, _tableElementsNumber[state.tableIndex + 1], false));
          } break;
          case 4: {
            List<Team>? teamListStored = await _databaseRepository.getData<Team>(_tableNames[state.tableIndex], Team.fromMap);
            while(teamListStored?.length != _tableElementsNumber[state.tableIndex]) {
              emit(StoreDataSuccess(state.tableIndex, teamListStored!.length, _tableElementsNumber[state.tableIndex], false));
              List<Team> teamListLoaded = await _allTeamsRepository.getTeams((teamListStored.length/10).floor() + 1);
              await _databaseRepository.insertData<Team>(teamListLoaded, _tableNames[state.tableIndex], (team) => team.toMap());
              teamListStored = await _databaseRepository.getData<Team>(_tableNames[state.tableIndex], Team.fromMap);
            }
            emit(StoreDataSuccess(state.tableIndex + 1, 0, _tableElementsNumber[state.tableIndex + 1], false));
          } break;
          case 5: {
            List<Akatsuki>? akatsukiListStored = await _databaseRepository.getData<Akatsuki>(_tableNames[state.tableIndex], Akatsuki.fromMap);
            while(akatsukiListStored?.length != _tableElementsNumber[state.tableIndex]) {
              emit(StoreDataSuccess(state.tableIndex, akatsukiListStored!.length, _tableElementsNumber[state.tableIndex], false));
              List<Akatsuki> akatsukiListLoaded = await _allAkatsukiRepository.getAkatsuki((akatsukiListStored.length/10).floor() + 1);
              await _databaseRepository.insertData<Akatsuki>(akatsukiListLoaded, _tableNames[state.tableIndex], (akatsuki) => akatsuki.toMap());
              akatsukiListStored = await _databaseRepository.getData<Akatsuki>(_tableNames[state.tableIndex], Akatsuki.fromMap);
            }
            emit(StoreDataSuccess(state.tableIndex , _tableElementsNumber[state.tableIndex], _tableElementsNumber[state.tableIndex], true));
          } break;
        }
      }
      _databaseRepository.close();
    } catch(err) {
      emit(StoreDataFailure(state.tableIndex, state.loadedElements, _tableElementsNumber[state.tableIndex], err.toString()));
    }
  }

}