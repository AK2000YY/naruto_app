import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_app/business_logic/character_search/search_character_bloc.dart';
import 'package:naruto_app/core/constant/color.dart';
import 'package:naruto_app/data/repository/database_repository.dart';
import 'package:naruto_app/view/widget/characters/custom_text_field.dart';
import 'package:naruto_app/view/widget/characters/search_list_result.dart';


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
              searchCharacterState: state,
            )
    );
  }
}


class PartSearchView extends StatelessWidget {

  final SearchCharacterState searchCharacterState;

  const PartSearchView({super.key, required this.searchCharacterState});

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
          if(searchCharacterState is SearchCharacterInitial)
            Expanded(
                child: Center(
                    child: Text("no results", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white))
                )
            )
          else if(searchCharacterState is SearchCharacterSuccess)
            SearchListResult(searchCharacterState: searchCharacterState)
          else
            const Expanded(
                child: Center(
                  child: CircularProgressIndicator(color: Colors.amber),
                )
            )
        ],
      ),
    );
  }
}

