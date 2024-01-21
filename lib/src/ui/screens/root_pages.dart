import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'addAllarmPage.dart';
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

  List<Widget> pages = const [
    homePage(),
    addAllarmPage(),
    favoritePage(),
    myAccountPage(),
  ];

  List<SvgPicture> iconList = [
    SvgPicture.asset('assets/images/home-icon.svg'),
    SvgPicture.asset('assets/images/search-icon.svg'),
    SvgPicture.asset('assets/images/favorite-icon.svg'),
    SvgPicture.asset('assets/images/profile-icon.svg'),
  ];

  List<String> titleList = [
    'Home',
    'Search',
    'Favorite',
    'Profile',
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: (_bottomNavIndex!=0) ? AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[_bottomNavIndex], style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 24,
            ),),
            Icon(Icons.notifications, color: Colors.black, size: 30.0,)
          ],
        ),
        elevation: 0.0,
      ) : null,
      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your FAB's onPressed logic here
        },
        backgroundColor: Colors.grey,
        child: Text('Map'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: iconList[0],
            label: titleList[0],
          ),
          BottomNavigationBarItem(
            icon: iconList[1],
            label: titleList[1],

          ),
          BottomNavigationBarItem(
            icon: iconList[2],
            label: titleList[2],
          ),
          BottomNavigationBarItem(
            icon: iconList[3],
            label: titleList[3],
          ),
        ],
      ),
    );
  }

  Widget buildCustomIcon(SvgPicture iconData, int index) {
    return Column(
      children: [
        iconData,
        SizedBox(),
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
}
