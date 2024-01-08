import 'package:flutter/material.dart';

import '../models/onBoanding_model.dart';

class OnBoardingClient extends StatefulWidget {
  const OnBoardingClient({super.key});

  @override
  State<OnBoardingClient> createState() => _OnBoardingClientState();
}

class _OnBoardingClientState extends State<OnBoardingClient> {
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Padding(
          padding: EdgeInsets.all(6.0),
          child: Container(
            margin: EdgeInsets.only(top: 40),
            child: Row(
              children: [
                Container(
                  height: 38,
                  width: 90,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDFDFDF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      'تخطي',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        height: 0.15,
                        letterSpacing: 0.36,
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 3),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // Handle search icon press
                      print('Search icon pressed!');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Text(
                        contents[i].title,
                        textAlign: TextAlign.end,
                        style: TextStyle(

                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        contents[i].discription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            contents.length,
                                (index) => buildDot(index, context),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          contents[i].image,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Container(
            height: 60,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
              if (currentIndex == contents.length - 1) {
                // Handle the action when on the last page
                print("Continue pressed on the last page");
              } else {
                // Move to the next page
                _controller.nextPage(
                duration: Duration(milliseconds: 100),
                curve: Curves.bounceIn,
                );
               }
              },
              style: ElevatedButton.styleFrom(
              primary: Color(0xFF1F4C6B),
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              ),
              ),
              child: Text(
              currentIndex == contents.length - 1 ? "Continue" : "Next",
              ),
            ),
          )

    ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 6,
      width: currentIndex == index ? 12 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
    );
  }
}

