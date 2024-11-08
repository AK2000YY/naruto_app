import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_app/business_logic/all_characters/all_characters_bloc.dart';
import 'package:naruto_app/core/constant/color.dart';
import 'package:naruto_app/data/repository/all_characters_repository.dart';
import 'package:http/http.dart' as http;

import '../widget/characters/character_list.dart';

class CharactersScreen extends StatelessWidget {

  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (_) => AllCharactersRepository(http.Client()),
        child: const ForAllCharacterBloc()
    );
  }
}

class ForAllCharacterBloc extends StatelessWidget {
  const ForAllCharacterBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => AllCharactersBloc(context.read<AllCharactersRepository>())..add(AllCharactersFetched()),
        child: const AllCharacters()
    );
  }
}


class AllCharacters extends StatefulWidget {
  const AllCharacters({super.key});

  @override
  State<AllCharacters> createState() => _AllCharactersState();
}

class _AllCharactersState extends State<AllCharacters> {

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  _onScroll() {
    if(_isBottom) context.read<AllCharactersBloc>().add(AllCharactersFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= maxScroll;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Characters", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
        centerTitle: true,
        backgroundColor: AppColor.backGround,
      ),
      body: SafeArea(
        child: Container(
          color: AppColor.backGround,
          width: double.infinity,
          height: double.infinity,
          child: BlocBuilder<AllCharactersBloc, AllCharactersState>(
              // buildWhen: (cur, prev) => cur.runtimeType != prev.runtimeType,
              builder: (context, state) =>
              switch(state) {
                AllCharactersInitial() || AllCharactersLoad() =>
                  const Center(child: CircularProgressIndicator(color: Colors.amber)),
                AllCharactersSuccess() || AllCharactersPaging() =>
                  CharactersList(
                      scrollController: _scrollController,
                      characters: state.characters!,
                      hasReachedMax: state.hasReachedMax ?? false
                  ),
                AllCharactersFailure() => Center(
                  child: Text(
                    state.error!,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                  )
                ),
              }
          ),
        ),
      ),
    );
  }
}