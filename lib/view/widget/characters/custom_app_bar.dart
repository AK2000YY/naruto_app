
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomAppBar extends StatelessWidget {

  final bool isVisible;

  const CustomAppBar({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: AppColor.backGround.withOpacity(isVisible? 0.4 : 0),
      child: Center(
        child: Text(isVisible ? "Characters" : "", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),),
      ),
    );
  }
}