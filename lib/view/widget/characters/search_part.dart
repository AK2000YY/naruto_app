import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_app/business_logic/character_search/search_character_bloc.dart';
import 'package:naruto_app/core/constant/color.dart';
import 'package:naruto_app/data/model/character.dart';
import 'package:naruto_app/data/repository/database_repository.dart';
import 'package:naruto_app/view/widget/characters/custom_text_field.dart';

class SearchPart extends StatelessWidget {
  const SearchPart({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (_) => DatabaseRepository(),
        child: const PartSearchBlocProvider(),
    );
  }
}

class PartSearchBlocProvider extends StatelessWidget {
  const PartSearchBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SearchCharacterBloc(context.read<DatabaseRepository>()),
        child: const PartSearchBlocBuilder(),
    );
  }
}


class PartSearchBlocBuilder extends StatelessWidget {
  const PartSearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCharacterBloc, SearchCharacterState>(
        builder: (context, state) =>
            PartSearchView(
              characters: state is SearchCharacterInitial ? [] : state.characters,
            )
    );
  }
}


class PartSearchView extends StatelessWidget {

  final List<Character> characters;

  const PartSearchView({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColor.backGround,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: CustomTextField(
              onTap: (val) {
                context.read<SearchCharacterBloc>().add(SearchCharacterStarted(val));
              },
            ),
          ),
          Expanded(
              child: characters.isNotEmpty ?
                ListView.builder(
                    itemCount: characters.length,
                    itemBuilder: (context, index) =>
                        Container(
                          height: 40,
                          width: double.infinity,
                          color: Colors.black45,
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Center(
                            child: Text(characters[index].name!, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                          ),
                        )
                ) :
                Center(
                  child: Text("no result", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                )

          )
        ],
      ),
    );
  }
}

