import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';

class GenieScreen extends StatelessWidget {
  const GenieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double w = size.width;
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.35,
                  decoration: BoxDecoration(
                    //color: Color.fromARGB(255, 235, 240, 237),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    gradient: LinearGradient(
                        //stops: [0.1, 0.9],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color.fromARGB(255, 219, 207, 240),
                          Colors.deepPurple.shade100,
                        ]),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/home_delivery.png',
                      width: (150.0),
                      height: (150.0),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    PreferredSize(
                        preferredSize: Size.fromHeight(50), child: AppBarUI()),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Divider(
                        height: 10,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "genie",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: SizedBox(
                        width: 250,
                        child: Text(
                          "Pick up or drop off anything instantly.",
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              color: Colors.deepPurple),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
                height: 80,
                margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
                alignment: Alignment.center,
                // height: 20.0,
                // color: Colors.transparent,
                /* decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black12,
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white70,
                ), */
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            'assets/offer.png',
                            width: (40.0),
                            height: (40.0),
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
                )),
            Container(
              height: 200,
              margin: const EdgeInsets.only(
                  left: 15, right: 15, top: 15, bottom: 15),
              alignment: Alignment.center,
              // height: 20.0,
              // color: Colors.transparent,
              decoration: BoxDecoration(
                /* border: Border.all(
                    color: Colors.black12, width: 1.0, style: BorderStyle.none), */
                borderRadius: BorderRadius.circular(15),
                color: Colors.red.shade100,
              ),
              child: Column(
                children: [
                  Container(
                      height: 150,
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 15, bottom: 15),
                      alignment: Alignment.center,
                      // height: 20.0,
                      // color: Colors.transparent,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black12,
                            width: 1.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Pick up or send anything",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            const Text(
                              "Sit back, relax and let Genie do the rest",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                            /* TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Set pick up & drop location",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ), */
                            SizedBox(
                              width: double.infinity, // <-- Your width
                              height: 50, // <-- Your height

                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text(
                                        'Set pick up & drop location'), // <-- Text
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      // <-- Icon
                                      Icons.arrow_forward,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 15),
                    child: Row(
                      children: const [
                        Text(
                          "One",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Extra 10% off on Genie delivery fee with One",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
