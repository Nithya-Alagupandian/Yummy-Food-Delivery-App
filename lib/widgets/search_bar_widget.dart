import 'package:flutter/material.dart';
import 'package:yummy_food_delivery/screens/filter_screen.dart';

import '../utils/colors.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.only(right: 10),
      // padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(20)),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            //const FilterScreen();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const FilterScreen()));
          },
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Search for the restaurant, item or more",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.black54),
                      ),

                      /* child: SizedBox(
                        // height: 20,
                        child: TextField(
                          decoration:
                              InputDecoration.collapsed(hintText: 'Username'),
                          style: TextStyle(
                              fontSize: 40.0, height: 2.0, color: Colors.black),
                        ),
                      ), */
                    ),
                  ],
                ),
              ),
              const Icon(Icons.search, color: Colors.black87, size: 25),
              const SizedBox(
                height: 25,
                child: VerticalDivider(
                  color: Colors.black54,
                  thickness: 0.5,
                  indent: 5,
                  endIndent: 0,
                  width: 20,
                ),
              ),
              /* IconButton(
                icon: const Icon(Icons.keyboard_voice_rounded,
                    color: primaryColor, size: 25),
                onPressed: () {},
                color: primaryColor,
              ) */
              GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0),
                          ),
                        ),
                        backgroundColor: Colors.white, // <-- SEE HERE
                        builder: (context) {
                          return SizedBox(
                            height: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: const <Widget>[
                                Text(
                                  "Hi, I'm Listening. Try Saying...",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                      color:
                                          Color.fromARGB(255, 129, 127, 127)),
                                ),
                                Text(
                                  '"Masala Dhosa"',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Colors.red),
                                ),
                                Image(
                                  image: AssetImage('assets/sound.gif'),
                                  width: 45,
                                  height: 45,
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: const Icon(Icons.keyboard_voice_rounded,
                      color: primaryColor)),
            ],
          ),
        ),
      ),
    );
  }
}
