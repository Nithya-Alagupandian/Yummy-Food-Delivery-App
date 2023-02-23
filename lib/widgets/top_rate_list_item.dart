import 'package:flutter/material.dart';

import '../models/category_model.dart';

class TopRateItemStateFul extends StatefulWidget {
  int index;

  List<Category> itemList;

  TopRateItemStateFul(this.itemList, this.index, {super.key});

  @override
  TopRateItemView createState() => TopRateItemView(itemList, index);
}

class TopRateItemView extends State<TopRateItemStateFul> {
  List<Category> itemList = <Category>[];
  int index;
  TopRateItemView(this.itemList, this.index);
  bool isFavt = false;
  String url = 'assets/favt.png';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavt = isFavt ? false : true;

          url = isFavt ? 'assets/red_favt.png' : 'assets/favt.png';

          // print('IsFavt : $isFavt :  $url');
        });
      },
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
        // padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              //  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: ExactAssetImage('assets/biryani.jpg'),
                      fit: BoxFit.cover),
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(
                children: [
                  //shade
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      // height: MediaQuery.of(context).size.height * 0.3,
                      //width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            stops: [0.3, 0.9],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Color.fromARGB(255, 226, 13, 169)
                            ]),
                      ),
                    ),
                  ),

                  //offer
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      color: Colors.transparent,
                      margin:
                          const EdgeInsets.only(top: 15, bottom: 10, left: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '60% OFF',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.0,
                                color: Colors.white),
                          ),
                          Text(
                            'UPTO ₹100',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 8.0,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //ad
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(5.0),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          SizedBox(
                            height: 15,
                            child: VerticalDivider(
                              color: Colors.white,
                              thickness: 2,
                              indent: 1,
                              endIndent: 1,
                              width: 10,
                            ),
                          ),
                          Text(
                            'AD',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.0,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //favt
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                        url,
                        width: (isFavt ? 20.0 : 15.0),
                        height: (isFavt ? 20.0 : 15.0),
                      ),

                      /* Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ), */
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              //padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hotel Ganga',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12.0,
                          color: Colors.black),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/star.png",
                          width: 15,
                          height: 15,
                        ),
                        const Text(
                          ' 4.1 . 24 mins',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 10.0,
                              color: Colors.black),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
