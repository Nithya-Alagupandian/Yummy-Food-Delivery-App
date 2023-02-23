import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../utils/arrays.dart';

// ignore: must_be_immutable
class SliderView extends StatefulWidget {
  List<String> list = <String>[];

  SliderView(this.list, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  SliderViewState createState() => SliderViewState(list);
}

class SliderViewState extends State<SliderView> {
  int _currentIndex = 0;
  String value = '';

  List<String> sliders = <String>[];

  SliderViewState(this.sliders);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            // enlargeCenterPage: true,
            //scrollDirection: Axis.vertical,
            onPageChanged: (index, reason) {
              setState(
                () {
                  _currentIndex = index;
                  value = "${_currentIndex + 1}/${sliders.length}";
                  //print(value);
                },
              );
            },
          ),
          items: sliders
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Card(
                    // margin: const EdgeInsets.only(bottom: 5.0, right: 10),
                    margin: const EdgeInsets.only(
                      top: 10.0,
                      left: 10.0,
                      bottom: 10.0,
                    ),
                    elevation: 6.0,
                    shadowColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            item,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: sliders.map((urlOfItem) {
            int index = sliders.indexOf(urlOfItem);
            // String value = "${_currentIndex + 1}/${categoryList2.length}";

            return Container(
              width: _currentIndex == index ? 30.0 : 10.0,
              height: _currentIndex == index ? 15.0 : 10.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _currentIndex == index ? Colors.pink : Colors.green),
              child: Center(
                child: Visibility(
                  visible: (_currentIndex == index) ? true : false,
                  child: Text(
                    value,
                    style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
