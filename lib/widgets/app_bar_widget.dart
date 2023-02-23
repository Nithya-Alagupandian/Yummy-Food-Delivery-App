import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AppBarUI extends StatelessWidget {
  const AppBarUI({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              //print("Clicked");
            },
            child: Row(
              children: const [
                Icon(
                  Icons.work,
                  color: Color.fromARGB(255, 230, 81, 0),
                  size: 15,
                ),
                SizedBox(width: 5),
                Text(
                  "Work",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.black),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black54,
                  size: 20,
                )
              ],
            ),
          ),
          const Text(
            "Mig 91, Ground Floor, Mogappair Eri Scheme, Mogappair East, chennai - 600037",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: Colors.black54),
          ),
        ],
      ),
      actions: [userIcon()],
    );
  }

  Widget userIcon() {
    return IconButton(
      icon: const Icon(
        Icons.account_circle,
        size: 30,
      ),
      onPressed: () {},
      color: Colors.black87,
    );
  }
}
