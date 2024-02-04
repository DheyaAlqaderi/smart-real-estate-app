import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PropertyImages extends StatefulWidget {
  const PropertyImages({super.key});

  @override
  State<PropertyImages> createState() => _PropertyImagesState();
}

class _PropertyImagesState extends State<PropertyImages> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<String> images =[
    'assets/images/image1.png',
    'assets/images/image3.png',
    'assets/images/Image2.png',
    'assets/images/image1.png',
    'assets/images/image1.png',

  ];

  List<String> title = [

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // the images

          Container(
            child: PageView.builder(
                controller: _controller,
                itemCount: images.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: ( _,i) {
                  return Image.asset(
                      images[i].toString(),
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width:double.infinity
                  );
                }
            ),
          ),


          // the back arrow button
          Positioned(
            top: 35.0,
            left: 10.0,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: 50,
                height: 50,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.800000011920929),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Icon(Icons.arrow_back),
              ),
            )
          ),

          // center text
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    if (currentIndex != 0) {
                      // Move to the previous page
                      _controller.previousPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    }
                  },
                  child: Container(
                    height: 83.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.300000011920929),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15)
                      )
                    ),
                    child: Center(
                      child: SvgPicture.asset('assets/images/next-icon.svg'),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    if (currentIndex != images.length - 1) {
                      // Move to the next page
                      _controller.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    }
                  },
                  child: Container(
                    height: 83.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.300000011920929),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)
                        )
                    ),
                    child: Center(
                      child: Transform.rotate(
                        angle: pi,
                        child: SvgPicture.asset('assets/images/next-icon.svg'),
                      )
                    ),
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
