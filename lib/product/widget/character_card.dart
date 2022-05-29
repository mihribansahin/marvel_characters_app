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
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.0),
        ),
        boxShadow: [
          BoxShadow(
            color: MyColors.marvelRed.withOpacity(0.2),
            spreadRadius: 1,
            blurStyle: BlurStyle.inner,
            blurRadius: 2,
            offset: Offset(5, 3),

            /// changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 4,
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
              margin: const EdgeInsets.only(left: 7, top: 10),
              child: Text(
                characterName,
                maxLines: 2,
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
