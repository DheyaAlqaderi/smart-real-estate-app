import 'package:flutter/material.dart';
import '../widgets/SliverAppBarWidget.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  List<bool> chipSelected = List.generate(20, (index) => false);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBarWidget(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                20,
                                    (index) => Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Container(
                                    height: 40, // Set the desired height
                                    child: ActionChip(
                                      label: Text('Department', style: TextStyle(color: chipSelected[index]? Colors.white: Colors.black),),
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

                          Divider(),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.red,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.red,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.red,
                              )
                            ],
                          )
                        ],
                      ),
                    );
                },
                childCount: 1, // Adjust based on the number of layouts
              ),
            ),
          ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: ,
      // ),
    );
  }
}

