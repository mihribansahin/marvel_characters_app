import 'package:flutter/material.dart';
import 'package:marvel_characters_app/feature/view_model/detail_view_model.dart';
import 'package:marvel_characters_app/product/constant/my_color.dart';
import 'package:marvel_characters_app/product/model/chars_model.dart';
import 'package:marvel_characters_app/product/model/results_model.dart';
import 'package:provider/provider.dart';

import '../../product/global.dart';
import '../../product/widget/comic_card.dart';

//TODO: sort comics by newest to oldest

/*for (int i = 0; i < tempComicString.length; i++) {
      print("splitt ${tempComicString[i]}");
      if (tempComicString[i]== (RegExp(r'[^0-9]'))) {
        print("number : ${tempComicString[i]}");
      }
    }*/

class DetailView extends StatelessWidget {
  ResultModel? resultModel;

  DetailView({Key? key, required ResultModel this.resultModel})
      : super(key: key);

  final DetailViewModel _detailViewModel = DetailViewModel();

  List<ComicCard> comicCardList = [];

  bool _comicDate2005Control(String date) {
    if (Global.isNumeric(date)) {
      if (int.parse(date) > 2005) {
        print("2005 and later : $date");
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _detailViewModel,
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          child: bodyColumn(context),
        ),
      ),
    );
  }

  Column bodyColumn(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              characterImageHeaderWidget(context),
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
                      resultModel!.name ?? "No Name",
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
                    descriptionWidget(resultModel: resultModel),
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
                    comicsWidget()
                  ],
                ),
              ),
            ]);
  }

  Container comicsWidget() {
    return Container(
      height: 170,
      child: RawScrollbar(
        thumbColor: MyColors.marvelRed,
        radius: const Radius.circular(20),
        thickness: 2,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          reverse: true,
          itemCount: resultModel!.comics!.comicItem!.length < 10
              ? resultModel!.comics!.comicItem!.length
              : 10,
          itemBuilder: (BuildContext context, int index) =>
              _comicDate2005Control(Global.myComicDateFunc(
                      resultModel!.comics!.comicItem![index].comicName!))
                  ? ComicCard(
                      comicDate: Global.myComicDateFunc(
                          resultModel!.comics!.comicItem![index].comicName!),
                      comicName: Global.myComicNameFunc(
                          resultModel!.comics!.comicItem![index].comicName!))
                  : Container(),
        ),
      ),
    );
  }

  Stack characterImageHeaderWidget(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            (resultModel!.thumbNail!.path! +
                "." +
                resultModel!.thumbNail!.extension!),
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          top: 40,
          left: 10,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }
}

class descriptionWidget extends StatelessWidget {
  const descriptionWidget({
    Key? key,
    required this.resultModel,
  }) : super(key: key);

  final ResultModel? resultModel;

  @override
  Widget build(BuildContext context) {
    return Text(
      resultModel!.description ?? "No Desscription",
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
    );
  }
}
