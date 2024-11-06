import 'package:flutter/material.dart';
import 'package:naruto_app/core/constant/image.dart';

import '../../../core/constant/color.dart';

class ListViewItem extends StatelessWidget {

  final String characterName;
  final String characterImage;
  final void Function() onPress;

  const ListViewItem({super.key, required this.characterName, required this.characterImage, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Column(
        children: [
          Expanded(
              flex: 9,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: FadeInImage.assetNetwork(
                  placeholder: AppImage.sharingLoad,
                  image: characterImage,
                  imageErrorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                    return Image.asset(AppImage.noImage);
                  },
                  placeholderFit: BoxFit.scaleDown,
                  fit: BoxFit.fill,
                ),
              )
          ),
          Expanded(
              flex: 2,
              child: InkWell(
                onTap: onPress,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: AppColor.onBackGround,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Text(
                          characterName,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
