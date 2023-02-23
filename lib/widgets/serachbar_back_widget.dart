import 'package:flutter/material.dart';
import 'package:yummy_food_delivery/utils/colors.dart';

class SearchBarWithBackArrow extends StatelessWidget {
  const SearchBarWithBackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          boxShadow: const [
            /* BoxShadow(
              color: Color.fromARGB(255, 204, 202, 202),
               blurRadius: 2.0,
              spreadRadius: 2.0,
              offset: Offset(
                0.0,
                0.0,
              ),
            ), */
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color.fromARGB(255, 211, 208, 208))),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context, false);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
                size: 18,
              )),
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
                        top: Radius.circular(2), bottom: Radius.circular(2))),
                hintText: 'Search for the restaurant, item or more',
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
                                  color: Color.fromARGB(255, 129, 127, 127)),
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
    );
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return const OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(2)),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 3,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 3,
        ));
  }
}
