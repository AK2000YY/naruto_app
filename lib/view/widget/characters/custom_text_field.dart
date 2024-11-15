// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

import 'package:flutter/material.dart';
import 'package:naruto_app/core/localization/localization.dart';

class CustomTextField extends StatelessWidget {

  final Function(String) onTap;

  const CustomTextField({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onTap,
      style: const TextStyle(
          color: Colors.amber
      ),
      cursorColor: Colors.amber,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.grey)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.amber)
          ),
          suffixIcon: const Icon(
            Icons.search_rounded,
          ),
          suffixIconColor: WidgetStateColor.resolveWith((states) =>
          states.contains(WidgetState.focused)
              ? Colors.amber
              : Colors.grey),
          hintText: "search".tr(context),
      ),
    );
  }
}

