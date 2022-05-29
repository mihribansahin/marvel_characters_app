import 'package:flutter/material.dart';
import 'package:marvel_characters_app/feature/view/detail_view.dart';
import 'package:marvel_characters_app/fetaure/view_model/home_view_model.dart';
import 'package:marvel_characters_app/product/model/chars_model.dart';
import 'package:provider/provider.dart';

import '../../product/constant/enum/status_enum.dart';
import '../../product/widget/character_card.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);
  static const _pageSize = 20;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double cardHeight = 300, cardWidth = 200;

  List<CharsModel>? charItems;

  final HomeViewModel _homeViewModel = HomeViewModel();

  List<Widget> charCard = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
    print("test count:${character!.data!.count}");
    print("Media width:${MediaQuery.of(context).size.width}");
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (() {
            if (screenWidth < 400) {
              return 2;
            } else if (screenWidth > 400 && screenWidth < 700) {
              return 3;
            }
            return 5;
          }()),
          crossAxisSpacing: 20,
          mainAxisSpacing: 30,
          childAspectRatio: cardWidth / cardHeight),
      shrinkWrap: true,
      itemCount: character.data!.results!.length,
      itemBuilder: (BuildContext ctx, i) {
        return InkWell(
            onTap: () {
              print(character.data!.results![i].id!);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailView(
                          resultModel: character.data!.results![i],
                        )),
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
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            child: Positioned.fill(
              child: Image.asset(
                'assets/images/marvel_background.jpg',
                fit: BoxFit.fitWidth,
              ),
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
