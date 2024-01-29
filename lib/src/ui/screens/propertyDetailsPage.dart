import 'package:flutter/material.dart';

import '../widgets/detailsPropertySection.dart';

class propertyDetailsPage extends StatefulWidget {
  var isFavorite;
  final String? image;
  final String? name;
  final String? address;
  final dynamic price;
  final dynamic rating;
   propertyDetailsPage({this.image, this.name, this.address, this.price, this.rating, this.isFavorite});

  @override
  State<propertyDetailsPage> createState() => _propertyDetailsPageState();
}

class _propertyDetailsPageState extends State<propertyDetailsPage> {
  bool _selected = true;
  List<String> someImageList = [
    'assets/images/image1.png',
    'assets/images/Image2.png',
    'assets/images/me.JPG',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // 1. image section
              imageSectionWidget(image: widget.image.toString()),

              // 2. details property section

              detailsPropertySection(name: widget.name, address: widget.address, price: widget.price,)

              // 3.
              // 4.
              // 5.
              // 6.
            ],
          ),
        ),
      ),
    );
  }

  // 1. image section
  Widget imageSectionWidget({required String image}){
    return Container(
      height: 514,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: 514,
            width: double.maxFinite,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(image.toString()),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
          ),

          // 1. appbar section
          appbarSection(),

          // 2. feature images and the rest images
          restImageSection(),

          // 3. ratings and type
          ratingType(rating: '4.5'),

        ],
      ),
    );
  }

  // 1.1 app bar
  Positioned appbarSection() {
    return Positioned(
        top: 35,
        right: 0,
        left: 0,
        child: Padding(
          padding: EdgeInsets.only(right: 8, left: 8),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF234F68),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.favorite, size: 25,),
                    color: (widget.isFavorite)? Colors.white: Colors.red,
                    onPressed: () {
                      setState(() {
                        _selected ? _selected=false : _selected=true;
                      });

                      // Add your button onPressed logic here
                      print('Button tapped!');
                    },
                  ),
                ),
              ),
              SizedBox(width: 13,),
              InkWell(
                onTap: (){
                  // Navigator.pop(context);
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
                  child: Icon(Icons.share),
                ),
              ),
              Spacer(flex: 3),
              InkWell(
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
                  child: Icon(Icons.arrow_forward),
                ),
              )

            ],
          ),
        ),
      );
  }

  // 1.2 rest image
  Positioned restImageSection(){
    return Positioned(
      bottom: 50,
      left: 8,
      child: Container(
        child: Column(
          children: [
            smallImage(image: someImageList[0],check: false),
            SizedBox(height: 6,),
            smallImage(image: someImageList[1], check: false),
            SizedBox(height: 6,),
            smallImage(image: someImageList[2], check: true, numImage: "20"),
          ],
        ),
      ),
    );
  }
  Widget smallImage({required String image, required bool check, String? numImage}){
    return Container(
      height: 60,
      width: 60,
      decoration: ShapeDecoration(
        color: Color(0xFFF5F4F7),
        image: DecorationImage(
          image: AssetImage(image.toString()),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: (check)?TextButton(
        onPressed: (){

        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.6),
                ]
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Center(
            child: Text(
              '+$numImage',
              style: TextStyle(
                color: Color(0xFFECEDF3),
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
      ):Container(),

    );
  }

  // 1.3 rating type
  Positioned ratingType({String? rating}){
    return Positioned(
      bottom: 50,
      right: 8,
      child: Row(
        children: [
          Container(
            width: 95,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16.50),
            decoration: ShapeDecoration(
              color: Color(0xAF1F4C6B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Center(
              child: Text(
                'شقة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.36,
                ),
              ),
            )
          ),
          SizedBox(width: 10,),
          Container(
            width: 95,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16.50),
            decoration: ShapeDecoration(
              color: Color(0xAF1F4C6B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Row(
              children: [
                Text(
                  '⭐',
                  style: TextStyle(
                    color: Color(0xFF242B5C),
                    fontSize: 15,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.45,
                  ),
                ),
// ---
              SizedBox(width: 5,),
                Text(
                  '$rating',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 0.42,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
