import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'onBoarding.dart';

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
              SvgPicture.asset(
                  "assets/images/welcome_image_client.svg",
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
                  margin: EdgeInsets.all(5.0),
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: (){

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1F4C6B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0), // Corner radius
                      ),
                    ),
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



              Container(
                margin: EdgeInsets.all(5.0),
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => onBoarding()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFF1F4C6B)),
                        borderRadius: BorderRadius.circular(30.0), // Corner radius
                      ),
                    ),
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

            ],
          ),
        ),
    );
  }

}
