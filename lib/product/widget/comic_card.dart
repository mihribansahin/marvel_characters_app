import 'package:flutter/material.dart';

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
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(2, 2), // changes position of shadow
          ),
        ],
      ),
      child: Center(
          child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Align(
                child: Text(
              comicName,
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade100,
              ),
            )),
          ),
          Expanded(
            flex: 1,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  comicDate,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade300,
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
