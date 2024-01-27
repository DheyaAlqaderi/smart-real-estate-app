import 'package:flutter/material.dart';

import '../../../services/models/chat/Rooms.dart';
import '../../widgets/roomUserWidget.dart';

class roomsPage extends StatefulWidget {
  const roomsPage({super.key});

  @override
  State<roomsPage> createState() => _roomsPageState();
}

class _roomsPageState extends State<roomsPage> {

  List<Rooms> rooms = [
    Rooms(text: "Jane Russel", secondaryText: "Awesome Setup", image: "assets/images/image1.png", time: "Now"),
    Rooms(text: "Glady's Murphy", secondaryText: "That's Great", image: "assets/images/image1.png", time: "Yesterday"),
    Rooms(text: "Jorge Henry", secondaryText: "Hey where are you?", image: "assets/images/image1.png", time: "31 Mar"),
    Rooms(text: "Philip Fox", secondaryText: "Busy! Call me in 20 mins", image: "assets/images/image1.png", time: "28 Mar"),
    Rooms(text: "Debra Hawkins", secondaryText: "Thank you, It's awesome", image: "assets/images/image1.png", time: "23 Mar"),
    Rooms(text: "Jacob Pena", secondaryText: "will update you in evening", image: "assets/images/image1.png", time: "17 Mar"),
    Rooms(text: "Andrey Jones", secondaryText: "Can you please share the file?", image: "assets/images/image1.png", time: "24 Feb"),
    Rooms(text: "John Wick", secondaryText: "How are you?", image: "assets/images/image1.png", time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade400,size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: rooms.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return roomUserWidget(
                  text: rooms[index].text,
                  secondaryText: rooms[index].secondaryText,
                  image: rooms[index].image,
                  time: rooms[index].time,
                  isMessageRead: (index == 0 || index == 3)?true:false,
                );
              },
            ),
            SizedBox(height: 150,)
          ],
        ),
      ),
    );
  }
}
