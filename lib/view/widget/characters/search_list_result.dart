import 'package:flutter/material.dart';
import 'package:naruto_app/business_logic/character_search/search_character_bloc.dart';

class SearchListResult extends StatelessWidget {

  final SearchCharacterState searchCharacterState;

  const SearchListResult({super.key, required this.searchCharacterState});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: searchCharacterState.characters.isNotEmpty ?
        ListView.builder(
            itemCount: searchCharacterState.characters.length,
            itemBuilder: (context, index) =>
                Container(
                  height: 40,
                  width: double.infinity,
                  color: Colors.black45,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Center(
                    child: Text(searchCharacterState.characters[index].name!, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
                  ),
                )
        ) :
        Center(
          child: Text("no result", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
        )

    );
  }
}
