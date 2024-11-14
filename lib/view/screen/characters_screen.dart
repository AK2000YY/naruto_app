import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_app/business_logic/all_characters/all_characters_bloc.dart';
import 'package:naruto_app/core/constant/color.dart';
import 'package:naruto_app/core/localization/localization.dart';
import 'package:naruto_app/data/repository/database_repository.dart';
import 'package:naruto_app/view/widget/characters/search_part.dart';

import '../widget/characters/character_part.dart';

class CharactersScreen extends StatelessWidget {

  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (_) => DatabaseRepository(),
        child: const ForAllCharacterBloc()
    );
  }
}


class ForAllCharacterBloc extends StatefulWidget {
  const ForAllCharacterBloc({super.key});

  @override
  State<ForAllCharacterBloc> createState() => _ForAllCharacterBlocState();
}

class _ForAllCharacterBlocState extends State<ForAllCharacterBloc> {

  int currentIndex = 0;
  final List<Widget> screens = const [
    AllCharacters(),
    SearchPart()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => AllCharactersBloc(context.read<DatabaseRepository>())..add(AllCharactersFetched()),
        child: //const AllCharacters()
        Scaffold(
          backgroundColor: AppColor.backGround,
          appBar: currentIndex == 0 ?
            AppBar(
              backgroundColor: AppColor.backGround,
              title: Text("allCharacter".tr(context), style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),),
              centerTitle: true,
              leading: InkWell(
                child: const Icon(
                    Icons.arrow_back, color: Colors.white
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              automaticallyImplyLeading: true,
            ) : null,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            backgroundColor: AppColor.backGround,
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(icon: const Icon(Icons.account_balance_sharp), label: "characters".tr(context)),
              BottomNavigationBarItem(icon: const Icon(Icons.search_rounded), label: "search".tr(context))
            ],
            onTap: (val) {
              setState(() {
                currentIndex = val;
              });
            },
          ),
          body: SafeArea(child: screens[currentIndex]),
        )
    );
  }
}