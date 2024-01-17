import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_real_estate_app/src/services/localdb/Managedb.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(270),
        child: AppBar(
          leading: Icon(Icons.accessibility_new_sharp),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 2,left: 5,top: 5),
              child: ElevatedButton(
                onPressed: () {
                  // Add your button click logic here
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  primary: Colors.white,
                  side: BorderSide(color: Color(0xFF1F4C6B), width: 1),
                ),
                child: Center(
                  child: Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10,top: 5),
              child: CircleAvatar(
                radius: 25, // half of the desired width and height
                child: SvgPicture.asset(
                  'assets/images/facebook-icon.svg',
                  fit: BoxFit.cover,
                ), // or NetworkImage for network images
                backgroundColor: Colors.white,
              ),
            ),
          ],
          flexibleSpace: Padding(
            padding: EdgeInsets.only(left: 100),
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0x1F4C6B4D),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200.0),
                  bottomLeft: Radius.circular(200.0),
                  bottomRight: Radius.circular(100.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(padding: EdgeInsets.all(60)),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      'مهلا، ضياء! ',
                      style: TextStyle(
                        color: Color(0xFF242B5C),
                        fontSize: 25,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500,
                        height: 0.06,
                        letterSpacing: 0.75,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(15)),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                          'لنبدأ بالاستكشاف',
                      style: TextStyle(
                        color: Color(0xFF242B5C),
                        fontSize: 25,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500,
                        height: 0.06,
                        letterSpacing: 0.75,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      height: 63,
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF5F4F7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            hintText: "Search ..."
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<String?>(
            future: Managedb.getToken(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final String? retrievedToken = snapshot.data;
                return Center(child: Text('Your Token ياغالي  :\n ${retrievedToken ?? "No token available"}'));
              }
            },
          ),
        ],
      ),
    );
  }
}
