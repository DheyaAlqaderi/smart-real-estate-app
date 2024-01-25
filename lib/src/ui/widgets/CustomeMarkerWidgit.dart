import 'package:flutter/material.dart';

class CustomeMarkerWidgit extends StatelessWidget {
   final double price;

  const CustomeMarkerWidgit({
    super.key,
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75.0,
        width: 80.0,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              height: 47.0,
              margin: const EdgeInsets.only(bottom: 8.0),
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Color(0xFFF5F4F7),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5), // Choose the color of the border
                  width: 1.0, // Adjust the width of the border
                ),
              ),
              child: Text(
                '$price',
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),

            const Align(
              alignment: Alignment.bottomCenter,
              child: Icon(
                  Icons.arrow_drop_down,
                color: Color(0xFF242B5C),
                size: 40,
              ),
            ),

          ],
        ),
    );
  }
}
