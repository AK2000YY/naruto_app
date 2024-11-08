import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../data/model/character.dart';
import 'list_view_item.dart';

class CharactersList extends StatelessWidget {

  final ScrollController scrollController;
  final List<Character> characters;
  final bool hasReachedMax;

  const CharactersList({super.key,required this.scrollController, required this.characters,required this.hasReachedMax});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColor.backGround,
      child: ListView.builder(
          controller: scrollController,
          itemCount: characters.length + ( hasReachedMax ? 0 : 1 ),
          itemBuilder: (context, index) {
            if(index < characters.length) {
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
                      characterName: characters[index].name!,
                      characterImage: characters[index].images!.isEmpty ? "" : characters[index].images![0],
                      onPress: (){}
                  )
              );
            } else {
              return const SizedBox(
                width: double.infinity,
                height: 80,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                ),
              );
            }
          }
      )
    );
  }
}