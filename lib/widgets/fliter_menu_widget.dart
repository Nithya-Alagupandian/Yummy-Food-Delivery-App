import 'package:flutter/material.dart';

import '../utils/arrays.dart';

class FilterMenuListWidget extends StatelessWidget {
  List<String> filters;
  FilterMenuListWidget(this.filters, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 35,
      child: ListView.builder(
          //shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: itemFilterList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              alignment: Alignment.center,
              // height: 20.0,
              // color: Colors.transparent,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black, width: 1.0, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade100,
              ),
              child: Text(
                filters[index],
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.0,
                    color: Colors.black),
              ),
            );
          }),
    );
  }
}
