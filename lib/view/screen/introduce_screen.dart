import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naruto_app/business_logic/store_data/store_data_bloc.dart';
import 'package:naruto_app/core/constant/color.dart';
import 'package:naruto_app/core/constant/image.dart';
import 'package:naruto_app/data/repository/all_akatsuki_repository.dart';
import 'package:naruto_app/data/repository/all_characters_repository.dart';
import 'package:http/http.dart' as http;
import 'package:naruto_app/data/repository/all_clans_repository.dart';
import 'package:naruto_app/data/repository/all_tailed_beasts_repository.dart';
import 'package:naruto_app/data/repository/all_teams_repository.dart';
import 'package:naruto_app/data/repository/all_villages_repository.dart';
import 'package:naruto_app/data/repository/database_repository.dart';
import 'package:naruto_app/view/screen/main_screen.dart';

class IntroduceScreen extends StatelessWidget {
  const IntroduceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AllCharactersRepository>(create: (_) => AllCharactersRepository(http.Client())),
          RepositoryProvider<AllClansRepository>(create: (_) => AllClansRepository(http.Client())),
          RepositoryProvider<AllVillagesRepository>(create: (_) => AllVillagesRepository(http.Client())),
          RepositoryProvider<AllTailedBeastsRepository>(create: (_) => AllTailedBeastsRepository(http.Client())),
          RepositoryProvider<AllTeamsRepository>(create: (_) => AllTeamsRepository(http.Client())),
          RepositoryProvider<AllAkatsukiRepository>(create: (_) => AllAkatsukiRepository(http.Client())),
          RepositoryProvider<DatabaseRepository>(create: (_) => DatabaseRepository())
        ],
        child: const IntroduceBlocProvider()
    );
  }
}


class IntroduceBlocProvider extends StatelessWidget {
  const IntroduceBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StoreDataBloc(
        context.read<DatabaseRepository>(),
        context.read<AllCharactersRepository>(),
        context.read<AllClansRepository>(),
        context.read<AllVillagesRepository>(),
        context.read<AllTailedBeastsRepository>(),
        context.read<AllTeamsRepository>(),
        context.read<AllAkatsukiRepository>(),
      )..add(StoreDataFetched()),
      child: const IntroduceBlocBuilder(),
    );
  }
}


class IntroduceBlocBuilder extends StatelessWidget {
  const IntroduceBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StoreDataBloc, StoreDataState>(
        listener: (context, state) {
          if(state is StoreDataSuccess && state.isComplete) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => const MainScreen()
              )
            );
          }
        },
        child: BlocBuilder<StoreDataBloc, StoreDataState>(
            builder: (context, state) {
              return IntroduceView(
                loadedPartWidth: state.tableIndex + 1,
                loadedElementWidth: state.loadedElements,
                totalElement: state.totalElements,
              );
            }
        ),
    );
  }
}


class IntroduceView extends StatelessWidget {

  final int loadedPartWidth;
  final int loadedElementWidth;
  final int totalElement;

  const IntroduceView({super.key, required this.loadedPartWidth, required this.loadedElementWidth, required this.totalElement});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width - 20;
    return Scaffold(
      backgroundColor: AppColor.backGround,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                  AppImage.narutoLogo,
                  width: screenWidth - 10,
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
            Positioned(
                bottom: 110,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  width: screenWidth,
                  height: 10,
                )
            ),
            Positioned(
                bottom: 110,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  width: (screenWidth*loadedElementWidth)/totalElement,
                  height: 10,
                )
            ),
            Positioned(
                bottom: 50,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  width: screenWidth,
                  height: 10,
                )
            ),
            Positioned(
                bottom: 50,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  width: (screenWidth*loadedPartWidth)/6,
                  height: 10,
                )
            )
          ],
        ),
      ),
    );
  }
}
