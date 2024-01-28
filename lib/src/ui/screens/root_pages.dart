import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_real_estate_app/src/ui/screens/MapPage.dart';
import 'package:smart_real_estate_app/src/ui/screens/chat/roomsPage.dart';
import 'favoritePage.dart';
import 'homePage.dart';
import 'myAccountPage.dart';

class root_pages extends StatefulWidget {
  const root_pages({super.key});

  @override
  State<root_pages> createState() => _root_pagesState();
}

class _root_pagesState extends State<root_pages> {

  int _bottomNavIndex =0;

  List<Widget> pages = [
    homePage(),
    roomsPage(),
    favoritePage(),
    myAccountPage(),
  ];

  List<SvgPicture> iconList = [
    SvgPicture.asset('assets/images/home-icon.svg'),
    SvgPicture.asset('assets/images/chat-icon2.svg'),
    SvgPicture.asset('assets/images/favorite-icon.svg'),
    SvgPicture.asset('assets/images/profile-icon.svg'),
  ];

  List<String> titleList = [
    'Home',
    'ChatBox',
    'Favorite',
    'Profile',
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: (_bottomNavIndex!=0)
          ? buildAppBar()
          : null,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: IndexedStack(
              index: _bottomNavIndex,
              children: pages,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: BottomNav(),
          )
        ]
      ),
      floatingActionButton: buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }


  AppBar buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleList[_bottomNavIndex],
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          Icon(Icons.notifications, color: Colors.black, size: 30.0),
        ],
      ),
      elevation: 0.0,
    );
  }

  Widget buildFloatingActionButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 70),
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: () {
          // Add your custom onPressed behavior here
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MapPage()),
          );
        },
        tooltip: 'Open the Map',
        child: Icon(
          Icons.map,
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }
  Widget buildCustomIcon(SvgPicture iconData, int index) {
    return Column(
      children: [
        iconData,
        // SizedBox(height: 5,),
        if (_bottomNavIndex == index)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: Color(0xFF1F4C6B), // Color of the dot
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
  Widget BottomNav(){
    return Container(
      height: kBottomNavigationBarHeight + 10, // Add some extra space for design
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _bottomNavIndex, // Set the index of the selected item
        items: [
          BottomNavigationBarItem(
            icon: buildCustomIcon(iconList[0], 0),
            label: titleList[0],
          ),
          BottomNavigationBarItem(
            icon: buildCustomIcon(iconList[1], 1),
            label: titleList[1],
          ),
          BottomNavigationBarItem(
            icon: buildCustomIcon(iconList[2], 2),
            label: titleList[2],
          ),
          BottomNavigationBarItem(
            icon: buildCustomIcon(iconList[3], 3),
            label: titleList[3],
          ),
        ],
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }

}
