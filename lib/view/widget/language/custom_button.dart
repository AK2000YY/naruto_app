import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {

  final String textButton;
  final String image;
  final void Function()? onPressed;

  const CustomButton({super.key, required this.textButton, required this.image, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20)
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                image,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
              Text(textButton, style: const TextStyle(fontSize: 20, color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}
