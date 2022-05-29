import 'package:flutter/material.dart';
import 'package:marvel_characters_app/fetaure/detail/viewModel/detail_view_model.dart';
import 'package:marvel_characters_app/product/constant/my_color.dart';
import 'package:provider/provider.dart';

import '../../../product/widget/comic_card.dart';

//TODO: sort comics by newest to oldest

/*for (int i = 0; i < tempComicString.length; i++) {
      print("splitt ${tempComicString[i]}");
      if (tempComicString[i]== (RegExp(r'[^0-9]'))) {
        print("number : ${tempComicString[i]}");
      }
    }*/
class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final DetailViewModel _detailViewModel = DetailViewModel();
  String tempDesc =
      "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction!";

  String tempImageUrl =
      "https://terrigen-cdn-dev.marvel.com/content/prod/1x/012scw_ons_crd_03.jpg";
  String tempCharName = "WANDA MAXIMOFF";
  String tempComicString = "Uncanny X-Men (1963) #210";
  String? tempComicName = "Uncanny X-MendghfdMendghfd";
  String? tempComicDate = "(1963)";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _detailViewModel,
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        tempImageUrl,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      top: 30,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_circle_left_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        tempCharName,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        tempDesc,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Comics",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: MyColors.marvelRed,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        height: 1,
                        color: MyColors.marvelRed,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 150,
                        child: RawScrollbar(
                          thumbColor: MyColors.marvelRed,
                          radius: const Radius.circular(20),
                          thickness: 2,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) =>
                                ComicCard(
                              comicDate: tempComicDate!,
                              comicName: tempComicName!,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
