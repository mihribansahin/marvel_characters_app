import 'package:flutter/material.dart';

import '../constant/my_color.dart';

class CharacterCard extends StatelessWidget {
  double cardHeight, cardWidth;
  String characterName = " ";
  String characterPathUrl = "";

  CharacterCard(
      {Key? key,
      required double this.cardHeight,
      required double this.cardWidth,
      required String this.characterName,
      required var this.characterPathUrl})
      : super(key: key);

  double? screenHeight, screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 300, maxWidth: 100),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(40.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            spreadRadius: 2,
            blurRadius: 1,
            offset: Offset(1, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 5,
            child: Image.network(
              characterPathUrl,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            color: MyColors.marvelRed,
            height: 5,
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 5, top: 5),
              child: Text(
                characterName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.7,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
