import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../data/model/character.dart';
import 'custom_app_bar.dart';
import 'list_view_item.dart';

class CharactersList extends StatelessWidget {

  final ScrollController scrollController;
  final List<Character> characters;
  final bool hasReachedMax;
  final bool isVisible;

  const CharactersList({super.key,required this.scrollController, required this.characters,required this.hasReachedMax ,required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColor.backGround,
      child: Stack(
        children: [
          ListView.builder(
              controller: scrollController,
              itemCount: characters.length + ( hasReachedMax ? 2 : 1 ),
              itemBuilder: (context, index) {
                if(index == 0) {
                  return const CustomAppBar(isVisible: false);
                } else if(index < characters.length) {
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
                          characterName: characters[index-1].name!,
                          characterImage: characters[index-1].images!.isEmpty ? "" : characters[index-1].images![0],
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