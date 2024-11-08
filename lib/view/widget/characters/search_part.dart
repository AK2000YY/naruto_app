import 'package:flutter/material.dart';
import 'package:naruto_app/core/constant/color.dart';
import 'package:naruto_app/view/widget/characters/custom_text_field.dart';

class SearchPart extends StatelessWidget {
  const SearchPart({super.key});

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
            child: const CustomTextField(),
          )
        ],
      ),
    );
  }
}
