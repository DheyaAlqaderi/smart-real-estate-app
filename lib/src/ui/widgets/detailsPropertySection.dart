import 'package:flutter/material.dart';

class detailsPropertySection extends StatefulWidget {
  var name;
  var address;
  var price;
   detailsPropertySection({super.key, required this.name, required this.address, required this.price});

  @override
  State<detailsPropertySection> createState() => _detailsPropertySectionState();
}

class _detailsPropertySectionState extends State<detailsPropertySection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    '${widget.price} الف ',
                    textAlign: TextAlign.right,
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
                    textAlign: TextAlign.right,
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
              Spacer(flex: 2,),
              Column(
                children: [
                  Text(
                    '${widget.name}',
                    style: TextStyle(
                      color: Color(0xFF242B5C),
                      fontSize: 25,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 3,),
                  Text(
                    '${widget.address}',
                    style: TextStyle(
                      color: Color(0xFF53577A),
                      fontSize: 12,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
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
                    color: Color(0xAF1F4C6B),
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
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
