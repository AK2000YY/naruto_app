import 'package:flutter/material.dart';
import 'package:naruto_app/core/constant/color.dart';
import 'package:naruto_app/core/constant/image.dart';

class IntroduceScreen extends StatelessWidget {
  const IntroduceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                AppImage.narutoLogo
              ),
            ),
            Positioned(
                top: 80,
                left: 50,
                child: Image.asset(
                  height: 120,
                  width:120,
                  AppImage.akatsukiLogo
                )
            ),
            Positioned(
                top: 160,
                right: 50,
                child: Image.asset(
                    height: 120,
                    width: 120,
                    AppImage.akatsukiLogo
                )
            ),
            Positioned(
                bottom: 160,
                left: 50,
                child: Image.asset(
                    height: 120,
                    width:120,
                    AppImage.akatsukiLogo
                )
            ),
            Positioned(
                bottom: 80,
                right: 50,
                child: Image.asset(
                    height: 120,
                    width: 120,
                    AppImage.akatsukiLogo
                )
            ),
          ],
        ),
      ),
    );
  }
}
