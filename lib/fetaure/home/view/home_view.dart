import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marvel_characters_app/fetaure/detail/view/detail_view.dart';
import 'package:marvel_characters_app/fetaure/home/viewModel/home_view_model.dart';
import 'package:marvel_characters_app/product/model/chars_model.dart';
import 'package:provider/provider.dart';

import '../../../product/service/status.dart';
import '../../../product/widget/character_card.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  double cardHeight = 300, cardWidth = 200;
  List<CharsModel>? charItems;
  final HomeViewModel _homeViewModel = HomeViewModel();

  List<Widget> charCard = [];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _homeViewModel,
      child: Scaffold(
        body: context.watch<HomeViewModel>().state == Status.BUSY
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : context.watch<HomeViewModel>().state == Status.ERROR
                ? const Center(
                    child: Text(
                      "ERROR",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  )
                : Column(
                    children: [
                      headerWidget(context),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: characterListWidget(
                          context,
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }

  GridView characterListWidget(
    BuildContext context,
  ) {
    final character = context.watch<HomeViewModel>().charsModel;
    print("mihri name:${character!.data!.results![0].name}");

    print(
        "mihri path:${character.data!.results![0].thumbNail!.path! + "." + character.data!.results![0].thumbNail!.extension!}");

    print("Media width:${MediaQuery.of(context).size.width}");
    double screenWidth = MediaQuery.of(context).size.width;
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (() {
            if (screenWidth < 400) {
              return 2;
            } else if (screenWidth > 400 && screenWidth < 700) {
              return 3;
            } else
              return 5;
            // your code here
          }()),
          crossAxisSpacing: 20,
          mainAxisSpacing: 30,
          childAspectRatio: cardWidth / cardHeight),
      shrinkWrap: true,
      itemCount: character.data!.count!,
      itemBuilder: (BuildContext ctx, i) {
        return InkWell(
            onTap: () {
              print(i);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailView()),
              );
            },
            child: CharacterCard(
                cardHeight: cardHeight,
                cardWidth: cardWidth,
                characterName: character.data!.results![i].name!,
                characterPathUrl: character.data!.results![i].thumbNail!.path! +
                    "." +
                    character.data!.results![i].thumbNail!.extension!));
      },
    );
  }

  Container headerWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/marvel_background.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 30,
              width: 60,
              child: Image.asset(
                'assets/images/marvel_logo.jpg',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "MARVEL CHARACTERS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.7,
                    overflow: TextOverflow.visible,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Get hooked on a hearty helping of heroes and villains from the humble House of Ideas!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.7,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
