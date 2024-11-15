import 'package:flutter/material.dart';
import 'package:naruto_app/business_logic/character_search/search_character_bloc.dart';
import 'package:naruto_app/core/constant/color.dart';
import 'package:naruto_app/view/widget/characters/search_list_item.dart';

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
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.onBackGround,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SearchListItem(character: searchCharacterState.characters[index]),
                )
        ) :
        Center(
          child: Text("no result", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
        )

    );
  }
}
