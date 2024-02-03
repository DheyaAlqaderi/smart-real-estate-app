import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_real_estate_app/src/ui/widgets/attributeWidget.dart';
import 'package:smart_real_estate_app/src/ui/widgets/commentWidget.dart';

//ignore: must_be_immutable
class detailsPropertySection extends StatefulWidget {
  var name;
  var address;
  var price;
   detailsPropertySection({super.key, required this.name, required this.address, required this.price});

  @override
  State<detailsPropertySection> createState() => _detailsPropertySectionState();
}

class _detailsPropertySectionState extends State<detailsPropertySection> {
  late GoogleMapController _controller;
  Map<String, dynamic> propertyAttributes = {
    'النوع': 'منزل',
    'عدد غرف النوم': 3,
    'عدد الحمامات': 2,
    'المساحة (قدم مربع)': 2000,
    'السعر': 250000,
    'الجراج': true,
    'سنة البناء': 2005,
    'المدينة': 'نيويورك',
    // أضف المزيد من السمات حسب الحاجة
  };


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 180.0,
                child: Column(
                  children: [
                    Text(
                      '${widget.price} الف ',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Color(0xFF242B5C),
                        fontSize: 25,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 3,),
                    Text(
                      'كل شهر',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Color(0xFF53577A),
                        fontSize: 12,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.36,
                      ),
                    )
                  ],
                ),
              ),

              Spacer(flex: 2,),
              Container(
                width: 190.0,
                child: Column(
                  children: [
                    Text(
                      '${widget.name}',
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF242B5C),
                        fontSize: 25,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 3,),
                    Row(

                      children: [
                        Container(
                          width: 160.0,
                          child: Text(
                            '${widget.address}',
                            maxLines: 1, // Set the maximum number of lines
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Color(0xFF53577A),
                              fontSize: 12,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Icon(Icons.location_on_sharp,size: 15,),
                      ],

                    )
                  ],
                ),
              )
            ],
          ),

          SizedBox(height: 60.0,),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  width: 95,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: Color(0xAF1B4056),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'للبيع',
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
            ],
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 30,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: propertyAttributes.entries.map((entry) {
                String attributeName = entry.key;
                dynamic attributeValue = entry.value;

                // Generate a widget for each attribute
                return Padding(
                  padding: EdgeInsets.only(right: 6.0),
                  child: attributeWidget(attribute_name: attributeName, attribute_value: attributeValue),
                );
              }).toList(),
            ),
          ),

          SizedBox(height: 35,),
          Stack(
            children: [
              Container(
                height: 85.0,
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Color(0xAFDCD8D8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              Positioned(
                top: 15,
                right: 10,
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('assets/images/me.JPG'),
                  backgroundColor: Colors.white,
                )
              ),

              Positioned(
                top: 15,
                right: 80,
                child: Column(
                  children: [
                    Text(
                      "Dheya yahya",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      "وكيل عقاري",
                      style: TextStyle(
                        fontSize: 9.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 30,

                left: 10,
                child: Container(
                  child: Center(
                    child: SvgPicture.asset('assets/images/chat-icon.svg'),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 35,),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "الموقع",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                fontFamily: "Raleway",
                color: Color(0xFF252B5C),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 259,
                child: Text(
                      "صنعاء شارع الخسين خلف الجامعه الللبنانيه بجانب "
                      "بهارات ابن ياسين ",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Raleway",
                    color: Color(0xFF53587A),
                  ),
                ),
              ),
              ElevatedButton(
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
                    Icons.location_on,
                    color: Colors.black,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            height: 235,
            width: double.infinity,
            decoration: ShapeDecoration(
              color: Color(0xAFDCD8D8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: GestureDetector(
                    behavior: HitTestBehavior.opaque, // or HitTestBehavior.translucent
                    onTap: () {}, // Add any onTap handler if needed
                    child: Column(
                      children: [
                        Expanded( // Use Expanded to ensure the GoogleMap takes up available space
                          child:GoogleMap(
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(14.5678337, 43.2232772),
                              zoom: 7,
                            ),
                            markers: _markers,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          SizedBox(height: 35,),
          buildSectionHeader('التعليقات'),
          SizedBox(height: 10,),
          Stack(
            children: [
              Container(
                height: 85.0,
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Color(0xFF1F4C6B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              Positioned(
                  top: 15,
                  right: 10,
                  child: Container(
                    height: 53,
                    width: 53,
                    decoration: ShapeDecoration(
                      color: Color(0xFF252B5C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 23.0,
                      ),
                    ),
                  )
              ),

              Positioned(
                top: 15,
                right: 80,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              5,
                                  (index) => Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 13.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "4.9",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Text(
                      "التعليقات 112 من ",
                      style: TextStyle(
                        fontSize: 9.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 30,
                left: 10,
                child: Container(
                  height: 30.0,
                  width: 70.0,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage('assets/images/me.JPG'),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 20,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage('assets/images/me.JPG'),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 40,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage('assets/images/women.png'),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  )
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          commentWidget(userName: 'Dheya Yahya', text: "it is a beautiis a beautiful houseis a beautiful houseis a beautiful houseis a beautiful houseis a beautiful houseis a beautiful houseis a beautiful houseis a beautiful houseful house. ", date: "10 min", image: "assets/images/women.png",),
          SizedBox(height: 10,),
          InkWell(
              onTap: (){},
              child:Container(
                height: 58.05,
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Color(0xAFDCD8D8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Center(
                  child: Text(
                    "عرض جميع التقييمات",
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Raleway",
                    ),
                  ),
                ),
              ),
          )
        ],
      ),
    );
  }



  Widget buildSectionHeader(String text) {
    return Row(
      children: <Widget>[
        Container(
          child: InkWell(
            onTap: (){
              // Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(25),
            child: Container(
              width: 40,
              height: 40,

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
              child: Icon(Icons.add),
            ),
          ),
        ),
        Spacer(flex: 4),
        Text(
          text,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            fontFamily: "Raleway",
            color: Color(0xFF252B5C),
          ),
        ),
      ],
    );
  }

  Set<Marker> _markers = {};
  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    _addMarker(LatLng(14.5678337, 43.2232772), 'Marker Title', 'Marker Description');

  }
  void _addMarker(LatLng position, String title, String snippet) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          infoWindow: InfoWindow(
            title: title,
            snippet: snippet,
          ),
        ),
      );
    });
  }
//this is the function to load custom map style json
  void changeMapMode(GoogleMapController mapController) {
    getJsonFile("assets/map_style.json")
        .then((value) => setMapStyle(value, mapController));
  }
  //helper function
  void setMapStyle(String mapStyle, GoogleMapController mapController) {
    mapController.setMapStyle(mapStyle);
  }
  //helper function
  Future<String> getJsonFile(String path) async {
    ByteData byte = await rootBundle.load(path);
    var list = byte.buffer.asUint8List(byte.offsetInBytes,byte.lengthInBytes);
    return utf8.decode(list);
  }
}
