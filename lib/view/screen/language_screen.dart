import 'package:flutter/material.dart';
import 'package:naruto_app/core/localization/localization.dart';
import 'package:naruto_app/view/widget/language/custom_button.dart';

import '../../core/constant/image.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: Image.asset(
                  AppImage.language,
                  fit: BoxFit.cover,
                )
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              height: screenHeight* 5/6,
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: screenHeight * 1.7/6 ,
                child: Container(
                  margin: const EdgeInsetsDirectional.only(start: 10, bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("welcome".tr(context), style: const TextStyle(fontSize: 40 , color: Colors.white , fontWeight: FontWeight.bold)),
                      Text("let".tr(context), style: const TextStyle(fontSize: 20 , color: Colors.white))
                    ],
                  ),
                )
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                height: screenHeight* 1.7/6,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Text("choose".tr(context), style: const TextStyle(fontSize: 30),),
                      ),
                      CustomButton(textButton: "arabic".tr(context), image: AppImage.arabic, onPressed: (){
                      }),
                      CustomButton(textButton: "english".tr(context), image: AppImage.english, onPressed: (){
                      },)
                    ],
                  ),
                )
            )

          ],
        ),
      ),
    );
  }
}


