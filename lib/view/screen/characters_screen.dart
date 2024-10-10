import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_app/business_logic/all_characters/all_characters_bloc.dart';
import 'package:naruto_app/core/constant/color.dart';
import 'package:naruto_app/data/model/character.dart';
import 'package:naruto_app/data/repository/all_characters_repository.dart';
import 'package:http/http.dart' as http;

import '../widget/characters/list_view_item.dart';

class CharactersScreen extends StatelessWidget {

  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (_) => AllCharactersRepository(http.Client()),
        child: const AllCharacters()
    );
  }
}


class AllCharacters extends StatelessWidget {
  const AllCharacters({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AllCharactersBloc(context.read<AllCharactersRepository>())..add(AllCharactersFetched()),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: BlocBuilder<AllCharactersBloc, AllCharactersState>(
              builder: (context, state) =>
                  switch(state) {
                    AllCharactersInitial() =>
                      const Center(child: CircularProgressIndicator(color: Colors.amber)),
                    AllCharactersLoaded() =>
                      const Center(child: CircularProgressIndicator(color: Colors.amber)),
                    AllCharactersSuccess() =>
                      CharactersList(characters: state.characters!, isVisible: true),
                    AllCharactersFailure() => const Center(child: Text("failed"),),
                  }
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {

  final bool isVisible;

  const CustomAppBar({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: AppColor.backGround.withOpacity(isVisible? 0.4 : 0),
      child: Center(
        child: Text(isVisible ? "Characters" : "", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),),
      ),
    );
  }
}


class CharactersList extends StatelessWidget {

  final List<Character> characters;
  final bool isVisible;

  const CharactersList({super.key, required this.characters, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColor.backGround,
      child: Stack(
        children: [
          ListView.builder(
            itemCount: characters.length + 1,
            itemBuilder: (context, index) {
              if(index == 0) {
                return const CustomAppBar(isVisible: false);
              } else {
                return Container(
                    width: double.infinity,
                    height: 400,
                    margin: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white,
                        width: 0.8,
                      ),
                    ),
                    child: ListViewItem(
                        characterName: characters![index-1].name!,
                        characterImage: characters![index-1].images![0],
                        onPress: (){}
                    )
                );
              }
            }
          ),
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: CustomAppBar(isVisible: isVisible)
          )
        ],
      ),
    );
  }
}

