import 'package:flutter/material.dart';
import 'package:naruto_app/core/localization/localization.dart';
import 'package:naruto_app/data/model/main_screen_item.dart';

import '../../../core/constant/color.dart';

class ListViewItem extends StatelessWidget {
  final MainScreenItem mainScreenItem;

  const ListViewItem({super.key, required this.mainScreenItem});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Column(
        children: [
          Expanded(
              flex: 9,
              child: Image.asset(
                mainScreenItem.image,
                fit: BoxFit.fill,
              )
          ),
          Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: AppColor.onBackGround,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: Text(
                        mainScreenItem.title.tr(context),
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
