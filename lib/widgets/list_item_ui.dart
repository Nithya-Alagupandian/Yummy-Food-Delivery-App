import 'package:flutter/material.dart';

import '../models/category_model.dart';

class ImgTxtItemView extends StatelessWidget {
  List<Category> itemList = <Category>[];
  int index;
  ImgTxtItemView(this.itemList, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: FractionalOffset.bottomCenter,
      children: <Widget>[
        Column(
          children: [
            Container(
              margin:
                  const EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 15),
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
              width: 100,
              height: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage(itemList[index].categoryImage),
                      fit: BoxFit.cover),
                  // color: const Color.fromARGB(255, 185, 10, 10).withOpacity(0.3),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20)),
            ),
            Container(
              alignment: Alignment.center,
              height: 20.0,
              color: Colors.transparent,
              child: Text(
                itemList[index].categoryTitle,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.0,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
