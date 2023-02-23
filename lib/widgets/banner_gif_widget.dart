import 'package:flutter/material.dart';

class WhatsNewBanner extends StatelessWidget {
  const WhatsNewBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: NetworkImage(
                  'https://smithbrothersmedia.com.au/wp-content/uploads/2020/07/BeFitFood_Banner_4.gif'),
              fit: BoxFit.cover),
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
