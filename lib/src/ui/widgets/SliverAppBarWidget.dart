import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SliverAppBarWidget extends StatefulWidget {
  const SliverAppBarWidget({
    super.key,
  });

  @override
  State<SliverAppBarWidget> createState() => _SliverAppBarWidgetState();
}

class _SliverAppBarWidgetState extends State<SliverAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 2,left: 5,top: 4),
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
          padding: EdgeInsets.only(right: 10, top: 5),
          child: CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage('assets/images/me.JPG'),
            backgroundColor: Colors.white,
          ),
        ),

      ],
      expandedHeight:250,
      floating: true,
      pinned: true,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
            width: 100.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Color(0x1F4C6B4D), // or any desired color
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(250.0),
                bottomRight: Radius.circular(250.0),
                topLeft: Radius.circular(250)
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(padding: EdgeInsets.all(55)),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    'أهلا، ضياء! ',
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
                  padding: const EdgeInsets.only(right: 20, left: 10),
                  child: Container(

                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 63,
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
                        ),
                        SizedBox(width: 5), // Add some spacing between TextField and button
                        Center(

                          child: Container(
                            child: ElevatedButton(
                              onPressed: () {
                                // Add your button click logic here
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                primary: Colors.white,
                              ),
                              child: Center(
                                  child: SvgPicture.asset('assets/images/filter-icon.svg', fit: BoxFit.contain,)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )

        ),
        centerTitle: true,
        titlePadding: EdgeInsets.only(bottom: 16),
        collapseMode: CollapseMode.pin,
      ),
    );
  }
}