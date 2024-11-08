import 'package:flutter/material.dart';
import 'package:naruto_app/core/localization/localization.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
          color: Colors.amber
      ),
      cursorColor: Colors.amber,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
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

