import 'package:flutter/material.dart';
import 'package:smart_real_estate_app/src/ui/widgets/topRowList_homepage.dart';
import '../widgets/SliverAppBarWidget.dart';
import '../widgets/explorePropertiesWidget.dart';
import '../widgets/secondrealestate_topdetails.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}


class _homePageState extends State<homePage> {


  List<String> realEstateProperties = [
    'All',
    'Condominium',
    'Townhouse',
    'Apartment',
    'Duplex',
    'Triplex',
    'Fourplex',
    'Vacant Land',
    'Commercial Property',
    'Industrial Property',
    'Retail Space',
    'Office Space',
  ];

  late List<bool> chipSelected = List.generate(realEstateProperties.length, (index) => false);

  List<String> propertyImageList = [
    'assets/images/me.JPG',
    'assets/images/image1.png',
    'assets/images/login_image.png',
    'assets/images/image3.png',
    'assets/images/image1.png',
    'assets/images/login_image.png',
    'assets/images/image3.png',
  ];

  List<String> propertyTitleList = [
    "البرج المثالي",
    "two",
    "three",
    'four',
    'five',
    'six',
    'seven',
  ];

  List<dynamic> propertyPrice = [
    1000.0,
    500,
    6000,
    100000,
    54120,
    5410,
    7500
  ];



  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Scaffold(
        body: buildCustomScrollView(),
      ),
    );
  }

  CustomScrollView buildCustomScrollView() {
    return CustomScrollView(
        slivers: <Widget>[
          SliverAppBarWidget(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.all(3),
                      child: Column(
                        children: [
                          SingleChildScrollView(

                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                realEstateProperties.length,
                                    (index) => Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Container(
                                    height: 40, // Set the desired height
                                    child: ActionChip(
                                      label: Text(realEstateProperties[index], style: TextStyle(color: chipSelected[index]? Colors.white: Colors.black),),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      backgroundColor: chipSelected[index] ? Color(0xFF234F68) : Color(0xFFF5F4F7),
                                      onPressed: () {
                                        setState(() {
                                          // Deselect all chips
                                          for (int i = 0; i < chipSelected.length; i++) {
                                            chipSelected[i] = false;
                                          }
                                          // Select the clicked chip
                                          chipSelected[index] = true;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 32),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                propertyImageList.length,
                                    (index) => Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: makeItem(propertyImageList[index], propertyTitleList[index]),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                          Row(
                            children: <Widget>[
                              Container(
                                height: 38,
                                width: 90,
                                child: TextButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  child: Text(
                                    'عرض الكل',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Color(0xFF31A8EC),
                                      fontSize: 10,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.w600,
                                      height: 0.09,
                                      letterSpacing: 0.30,
                                    ),

                                  )
                                ),
                              ),
                              Spacer(flex: 3),
                              Container(
                                child: Text(
                                  'عقارات مميزة',
                                  style: TextStyle(
                                    color: Color(0xFF242B5C),
                                    fontSize: 18,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                    letterSpacing: 0.54,
                                  ),
                                )
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                propertyImageList.length,
                                    (index) => Padding(
                                  padding:  EdgeInsets.only(right: 10.0),
                                  child:  second_section(image: propertyImageList[index],name: propertyTitleList[index], address: "fifth street", price: 2000, rating: 4.5),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                          Row(
                            children: <Widget>[
                              Container(
                                height: 38,
                                width: 90,
                                child: TextButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                    ),
                                    child: Text(
                                      'استكشف',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Color(0xFF31A8EC),
                                        fontSize: 10,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w600,
                                        height: 0.09,
                                        letterSpacing: 0.30,
                                      ),

                                    )
                                ),
                              ),
                              Spacer(flex: 3),
                              Container(
                                  child: Text(
                                    'الوكيل العقاري الأعلى',
                                    style: TextStyle(
                                      color: Color(0xFF242B5C),
                                      fontSize: 18,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                      letterSpacing: 0.54,
                                    ),
                                  )
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                propertyImageList.length,
                                    (index) => Padding(
                                  padding:  EdgeInsets.only(right: 10.0),
                                  child:  buildColumn(index),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25,),
                          Row(
                            children: <Widget>[
                              Container(
                                height: 38,
                                width: 90,
                                child: TextButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                    ),
                                    child: Text(
                                      'استكشف',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Color(0xFF31A8EC),
                                        fontSize: 10,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w600,
                                        height: 0.09,
                                        letterSpacing: 0.30,
                                      ),

                                    )
                                ),
                              ),
                              Spacer(flex: 3),
                              Container(
                                  child: Text(
                                    'استكشاف العقارات القريبة',
                                    style: TextStyle(
                                      color: Color(0xFF242B5C),
                                      fontSize: 18,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                      letterSpacing: 0.54,
                                    ),
                                  )
                              ),
                            ],
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            spacing: 30.0, // Adjust the spacing between items
                            runSpacing: 10.0, // Adjust the spacing between lines
                            children: List.generate(
                              propertyImageList.length,
                                  (index) => exploreProperty(image: propertyImageList[index], price: propertyPrice[index], name: propertyTitleList[index], address: propertyTitleList[index]),
                            ),
                          ),
                          SizedBox(height: 50,)

                        ],
                      ),
                    );

                },
                childCount: 1, // Adjust based on the number of layouts
              ),
            ),
          ],
      );
  }

  Column buildColumn(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(propertyImageList[index]),
            backgroundColor: Colors.white,
          ),
        ),
        SizedBox(height: 4,),
        Text(
          propertyTitleList[index],
          maxLines: 1, // Set the maximum number of lines
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color(0xFF242B5C),
            fontSize: 10,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
            height: 0,
            letterSpacing: 0.30,
          ),
        )
      ],
    );
  }
}