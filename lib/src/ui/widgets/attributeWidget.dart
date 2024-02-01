import 'package:flutter/material.dart';

class attributeWidget extends StatefulWidget {
  var attribute_name;
  var attribute_value;
  attributeWidget({this.attribute_name, this.attribute_value});

  @override
  State<attributeWidget> createState() => _attributeWidgetState();
}

class _attributeWidgetState extends State<attributeWidget> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 50.0,
      child: Container(
        decoration: ShapeDecoration(
          color: Color(0xAFDCD8D8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Row(
              children: [
                Text(widget.attribute_value.toString(), style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Raleway',
                ),),
                SizedBox(width: 5,),
                Text(widget.attribute_name.toString(), style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: 'Raleway',
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
