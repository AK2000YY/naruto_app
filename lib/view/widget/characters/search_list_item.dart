// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

import 'package:flutter/material.dart';
import 'package:naruto_app/data/model/character.dart';

import '../../../core/constant/image.dart';

class SearchListItem extends StatelessWidget {

  final Character character;

  const SearchListItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: FadeInImage.assetNetwork(
            width: 50,
            height: 55,
            placeholder: AppImage.loading,
            image: character.images!.isEmpty ? "" : character.images![0],
            imageErrorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
              return Image.asset(AppImage.noImage);
            },
            placeholderFit: BoxFit.scaleDown,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          child: Text(character.name!, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white),),
        ),
        const Spacer(),
        IconButton(
            onPressed: (){},
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )
        )
      ],
    );
  }
}
