import 'package:flutter/material.dart';

import '../utils/arrays.dart';

class CheckItOutBanner extends StatelessWidget {
  const CheckItOutBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),

      // margin: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage(categoryList[0].categoryImage),
              fit: BoxFit.cover),
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20)),
      child: Align(
        alignment: Alignment.bottomRight,
        child: SizedBox(
          width: 120,
          height: 40,
          child: Center(
              child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color.fromARGB(255, 198, 20, 222), // Background color
              foregroundColor: Colors.white, // Text Color (Foreground color)
            ),
            child: const Text(
              'CHECK IT OUT!',
              style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () {},
          )),
        ),
      ),
    );
  }
}
