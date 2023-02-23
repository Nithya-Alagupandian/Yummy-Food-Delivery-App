import 'package:flutter/material.dart';
import '../utils/arrays.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/card_grid_widget.dart';
import '../widgets/slider_widget.dart';
import 'filter_screen.dart';

class InstamartScreen extends StatelessWidget {
  const InstamartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(1),
              height: size.height * 0.5,
              decoration: const BoxDecoration(
                //color: Color.fromARGB(255, 235, 240, 237),
                /* borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)), */
                gradient: LinearGradient(
                    //stops: [0.1, 0.9],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 243, 176, 198),
                      Colors.white,
                    ]),
              ),
            ),
            Column(
              children: [
                const PreferredSize(
                    preferredSize: Size.fromHeight(50), child: AppBarUI()),
                const instaSearchWidget(),
                const instaDelivery(),
                const megaSaleWidget(),
                const SizedBox(height: 8),
                const giftWidget(),
                const saveMoreCoupons(),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Hot Deals",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      CardGridWidget(categoryList),
                      SliderView(sliderList),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    /* return Container(
      height: size.height * 0.8,
      width: 600,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.2 - 20,
            decoration: const BoxDecoration(
              //color: Color.fromARGB(255, 235, 240, 237),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  //stops: [0.1, 0.9],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Color.fromARGB(255, 231, 223, 225)]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              // height: 40,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 204, 202, 202),
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                      offset: Offset(
                        0.0,
                        0.0,
                      ),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: const Color.fromARGB(255, 211, 208, 208))),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 15.0,
                          // height: 2.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                        /* prefixIcon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                          ), */
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(2),
                                bottom: Radius.circular(2))),
                        hintText: 'Search for brand or items',
                        contentPadding: const EdgeInsets.symmetric(vertical: 1),
                        /* suffixIcon: const Icon(
                            Icons.search,
                            color: Colors.red,
                          ) */
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                    child: VerticalDivider(
                      color: Colors.black26,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 0,
                      width: 20,
                    ),
                  ),
                  const Icon(Icons.search, color: Colors.grey)
                ],
              ),
            ),
          ),
        ],
      ),
    ); */
  }
}

class giftWidget extends StatelessWidget {
  const giftWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Column(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/gift.png',
                  width: (50.0),
                  height: (50.0),
                ),
              ),
              const SizedBox(width: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Also, get a surprise gift on orders above ₹999",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Hurry, available until stocks last!",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Divider(
              height: 10,
              thickness: 5,
            ),
          ),
        ],
      ),
    );
  }
}

class instaDelivery extends StatelessWidget {
  const instaDelivery({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Instamart',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.pink.shade900),
            ),
          ),
          Column(
            children: [
              const Text(
                'Delivering in',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Colors.black),
              ),
              Text(
                '20 - 25 mins',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.pink.shade900),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class saveMoreCoupons extends StatelessWidget {
  const saveMoreCoupons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Save more with coupons",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Container(
            height: 70,
            margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            alignment: Alignment.center,
            // height: 20.0,
            // color: Colors.transparent,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black12, width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white70,
            ),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/offer.png',
                    width: (50.0),
                    height: (50.0),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Flat ₹100 off",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "USE HELLOIM | ON ORDERS ABOVE ₹299",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class megaSaleWidget extends StatelessWidget {
  const megaSaleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.transparent,
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: ExactAssetImage('assets/insta5.jpg'),
                      fit: BoxFit.cover),
                  // color: Colors.pink,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/mega_sale.png',
              width: (100.0),
              height: (100.0),
            ),

            /* Icon(
            Icons.favorite,
            color: Colors.white,
          ), */
          ),
        ],
      ),
    );
  }
}

class instaSearchWidget extends StatelessWidget {
  const instaSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: const EdgeInsets.only(right: 10),
          // padding: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FilterScreen()));
              },
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Search for brand or items",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.search, color: Colors.black87, size: 25),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
