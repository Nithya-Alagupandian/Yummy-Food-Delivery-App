import 'package:flutter/material.dart';
import '../utils/arrays.dart';
import '../widgets/card_listview_widget.dart';
import '../widgets/serachbar_back_widget.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15, right: 5, top: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SearchBarWithBackArrow(),
                    const SizedBox(height: 10),
                    const Text('Recent Searches'),
                    const SizedBox(height: 10),
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 0.0, // gap between adjacent chips
                      runSpacing: 0.0, // gap between lines
                      children: <Widget>[
                        for (var i in recentSearchList)
                          chipDesign(i, Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 50,
                thickness: 5,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Trending Searches'),
                      const SizedBox(height: 10),
                      Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 0.0, // gap between adjacent chips
                        runSpacing: 0.0, // gap between lines
                        children: <Widget>[
                          for (var i in trendingSearchList)
                            chipDesign(i, Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 50,
                thickness: 5,
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Popular on Instamart'),
                    const SizedBox(height: 10),
                    CardListView(instamartPopItems),
                  ],
                ),
              ),
              const Divider(
                height: 50,
                thickness: 5,
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Popular Cuisiness'),
                    const SizedBox(height: 10),
                    CardListView(popularCuisList),
                  ],
                ),
              ),
              const Divider(
                height: 50,
                thickness: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///Common method to design a chip with different properties
///like label and background color
Widget chipDesign(String label, Color color) => Container(
      margin: const EdgeInsets.only(right: 10, top: 2, bottom: 2),
      child: Chip(
        avatar: const Icon(
          Icons.moving_sharp,
          color: Colors.grey,
          size: 18,
        ),
        label: Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: color,
        elevation: 4,
        shadowColor: Colors.grey[50],
        padding: const EdgeInsets.all(4),
      ),
    );

///Method to create a divider with added margin
/* Container divider(BuildContext context) => Container(
      margin: const EdgeInsets.only(left: 1, right: 1, top: 1, bottom: 1),
      child: const Divider(),
    ); */
