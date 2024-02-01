import 'package:flutter/material.dart';

class commentWidget extends StatefulWidget {
  var image;
  var userName;
  var text;
  var date;
  commentWidget({super.key, this.image, this.text, this.date, this.userName});

  @override
  State<commentWidget> createState() => _commentWidgetState();
}

class _commentWidgetState extends State<commentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Color(0xAFDCD8D8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  width: 247,
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Align(
                        alignment:  Alignment.centerRight,
                        child: Text(
                          widget.userName,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 8,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          widget.text,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 10.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 6,),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "منذ ${widget.date}",
                            textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.w400,
                            fontSize: 8.0,

                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(

              children: [
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(widget.image),
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
