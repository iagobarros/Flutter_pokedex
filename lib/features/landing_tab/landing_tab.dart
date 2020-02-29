import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/onboarding/onboarding.dart';
import 'package:pokedex/features/pokemon_grid/pokemon_grid.dart';
import 'package:pokedex/features/pokemon_list/pokemon_list.dart';
import 'package:pokedex/services/pokemon_service.dart';

class LandingTabPage extends StatelessWidget {
  int generation;
  LandingTabPage(int this.generation);

// navigationBar: CupertinoNavigationBar(
//           middle: Text(
//             widget.model.name.toUpperCase(),
//             style: TextStyle(color: Colors.white),
//           ),
//           actionsForegroundColor: Colors.white,
//           backgroundColor: Colors.blueGrey,
//         ),

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.blueGrey,
          inactiveColor: Colors.grey.withOpacity(0.8),
          activeColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                title: Text("List"), icon: Icon(CupertinoIcons.news)),
            BottomNavigationBarItem(
                title: Text("Grid"), icon: Icon(CupertinoIcons.news)),
            BottomNavigationBarItem(
                title: Text("Select Generation"), icon: Icon(CupertinoIcons.news)),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (BuildContext context) => PokemonListPage(PokemonServiceImpl(generation)));
              break;
            case 1:
              return CupertinoTabView(builder: (BuildContext context) => PokemonGridPage(generation));
              break;
            case 2:
              return OnboardingPage();
          }
        });
  }
}
