import 'package:flutter/material.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({super.key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                  "assets/images/welcome_image.jpg",
                fit: BoxFit.fitWidth,
                height: 175,
                width: double.infinity,
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text(
                'مرحبا بكم في تطبيق العقارات الذكي',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F4C6B),
                    fontFamily: 'Inter',
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'الرجاء إدخال التفاصيل الخاصة بك للتسجيل.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF000000)
                ),
              ),

              Container(
                width: 223,
                height: 210,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo_text.jpg"),
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.all(9.5)),


              GestureDetector(
                onTap: (){},
                child: Container(
                  width: 381,
                  height: 58,
                  decoration: ShapeDecoration(
                    color: Color(0xFF1F4C6B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'انضم كعميل',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.all(8.5)),

              Container(
                width: 381,
                height: 58,
                decoration: ShapeDecoration(
                  color: Color(0x00FFAF47),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF1F4C6B)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Center(
                  child: Text(
                    'انضم كمروج',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.all(9.5)),

              Container(
                width: 327,
                height: 22,
                child: Stack(
                  children: [
                    Positioned(
                      left: 148.50,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'او',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFA1A4C1),
                                fontSize: 10,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w600,
                                height: 0,
                                letterSpacing: 0.30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 158.50,
                      height: 70,
                      padding: const EdgeInsets.only(top: 22, bottom: 23),
                      decoration: ShapeDecoration(
                        color: Color(0xFFF5F4F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  child: Stack(children: [
                                      Image(image: AssetImage("assets/images/google_image.jpg")),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 158.50,
                      height: 70,
                      padding: const EdgeInsets.only(top: 22, bottom: 23),
                      decoration: ShapeDecoration(
                        color: Color(0xFFF5F4F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  child: Stack(children: [
                                    Image(image: AssetImage("assets/images/facebook_image.jpg")),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
    );
  }
}
