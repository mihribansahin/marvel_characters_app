import 'package:flutter/material.dart';
import 'package:marvel_characters_app/product/constant/my_color.dart';

class ComicCard extends StatelessWidget {
  String comicName = " ";
  String comicDate = "";

  ComicCard(
      {Key? key, required String this.comicName, required var this.comicDate})
      : super(key: key);

  double? screenHeight, screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        boxShadow: const [
          BoxShadow(
            color: MyColors.marvelRed,
            spreadRadius: 1,
            blurStyle: BlurStyle.outer,
            blurRadius: 3,
            offset: Offset(5, 6), // changes position of shadow
          ),
        ],
      ),
      child: Center(
          child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Align(
                child: Text(
              comicName,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade100,
                letterSpacing: 2,
              ),
            )),
          ),
          Expanded(
            flex: 1,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  comicDate.toString(),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade300,
                    letterSpacing: 2,
                  ),
                )),
          ),
          const SizedBox(
            height: 2,
          )
        ],
      )),
    );
  }
}
