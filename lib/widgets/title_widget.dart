import 'package:flutter/material.dart';

class AppTextView extends StatelessWidget {
  String title;
  double textSize;
  AppTextView(this.title, this.textSize, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.bold, fontSize: textSize),
      ),
    );
  }
}
