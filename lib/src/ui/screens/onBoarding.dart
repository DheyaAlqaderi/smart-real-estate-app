import 'package:flutter/material.dart';
import 'package:smart_real_estate_app/src/ui/screens/root_pages.dart';
import '../../services/models/onBoanding_model.dart';
import 'login_signup_page.dart';



class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
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
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40,right: 5,left: 5),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 38,
                      width: 90,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => root_pages()),
                          );
                        },
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
              Expanded(
                child: Container(
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
                        padding: const EdgeInsets.all(10),
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
                            SizedBox(height: 10),
                            Text(
                              contents[i].discription,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 40),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Image.asset(
                                  contents[i].image,
                                  fit: BoxFit.fill,
                                  height: double.infinity,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            top: 255, // Adjust the bottom margin as needed
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    contents.length,
                        (index) => buildDot(index, context),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 20.0, // Adjust the bottom margin as needed
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 60,
                margin: EdgeInsets.all(40),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (currentIndex == contents.length - 1) {
                      // Handle the action when on the last page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => login_signup()),
                      );
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
                    currentIndex == contents.length - 1 ? "أستمرار" : "التالي",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 0.48,
                    ),
                  ),
                ),
              )
            ),
          ),
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
        color: Color(0xFF252B5C),
      ),
    );
  }
}
