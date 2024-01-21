import 'package:flutter/material.dart';

class secondrealestate_topdetails extends StatefulWidget {
  const secondrealestate_topdetails({super.key});

  @override
  State<secondrealestate_topdetails> createState() => _secondrealestate_topdetailsState();
}

class _secondrealestate_topdetailsState extends State<secondrealestate_topdetails> {
  dynamic width = 268;
  dynamic hieght = 156;

  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
      ),
      onPressed: (){},
      child: Container(
        width: 268,
        height: 156,
        decoration: ShapeDecoration(
          color: Color(0xFFF5F4F7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 140,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    SizedBox(height: 8,),
                    Text(
                        'high quality apartment dfsgfghsg',
                        maxLines: 1, // Set the maximum number of lines
                        overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.36,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '4.9',
                          style: TextStyle(
                            color: Color(0xFF53577A),
                            fontSize: 8,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            height: 0.12,
                          ),
                        ),
                        Icon(Icons.star, color: Colors.orange, size: 10,)
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            'شارع الخمسين خل بهارات',
                            maxLines: 1, // Set the maximum number of lines
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFF53577A),
                              fontSize: 8,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(width: 2,),
                        Icon(Icons.location_on_sharp,color: Colors.grey, size: 10,)
                      ],
                    ),
                    Expanded(child: SizedBox(height: 10,)),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('شهر /',
                              maxLines: 1, // Set the maximum number of lines
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                              color: Color(0xFF242B5C),
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.48,
                            ),),
                          ),
                          Text(
                            'الف',
                            style: TextStyle(
                              color: Color(0xFF242B5C),
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: 0.48,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            '2000',
                            style: TextStyle(
                              color: Color(0xFF242B5C),
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: 0.48,
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            image_section()
          ],
        ),
      ),
    );
  }

  Container image_section() {
    return Container(
          width: 126,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/image1.png'),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Stack(
            children: [

              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 24.81,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF234F68),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.favorite, size: 11,),
                    color: selected? Colors.white: Colors.red,
                    onPressed: () {
                       setState(() {
                         selected ? selected=false : selected=true;
                      });
                      // Add your button onPressed logic here
                      print('Button tapped!');
                    },
                  ),
                )
              ),

              Positioned(
                bottom: 3,
                right: 5,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button onPressed logic here
                    print('Button tapped!');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    primary: Color(0xFF234F68),
                  ),
                  child: Container(
                    width: 41,
                    height: 27,
                    child: Center(
                      child: Text(
                        'شقة',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 0.24,
                        ),
                      ),
                    ),
                  ),
                )

              ),

            ],
          )
        );
  }
}
