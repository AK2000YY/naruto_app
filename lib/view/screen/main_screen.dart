// Copyright © AK2000YY, 2024. All rights reserved.
// Unauthorized copying of this file, via any medium, is strictly prohibited

import 'package:flutter/material.dart';
import 'package:naruto_app/core/constant/color.dart';
import 'package:naruto_app/core/localization/localization.dart';
import 'package:naruto_app/data/data_source/main_screen_list.dart';
import 'package:naruto_app/view/screen/characters_screen.dart';
import 'package:naruto_app/view/widget/main/list_view_item.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backGround,
        title: Text(
            "introduction".tr(context),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white)
        ),
        centerTitle: true,
      ),
      body: Container(
        color: AppColor.backGround,
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            itemCount: mainScreenItems.length,
            itemBuilder: (context, index) =>
                Container(
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
                  child:  ListViewItem(
                      mainScreenItem: mainScreenItems[index],
                      onPress: () {
                        switch(index) {
                          case 0: toScreen(
                              context,
                              const CharactersScreen()
                          );
                          break;
                        }
                      }
                  ),
                )
        ),
      ),
    );
  }
}


void toScreen(context, widget){
  Navigator.of(context).push(
    MaterialPageRoute(
        builder: (context) => widget
    )
  );
}