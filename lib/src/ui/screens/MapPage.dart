import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/CustomeMarkerWidgit.dart';
import '../widgets/secondrealestate_topdetails.dart';

List<Map<String, dynamic>> data = [
  {
    'id': '1',
    'globalKey': GlobalKey(),
    'position': const LatLng(15.123456, 44.654321),
    'widget': const CustomeMarkerWidgit(price: 123.45),
  },
  {
    'id': '2',
    'globalKey': GlobalKey(),
    'position': const LatLng(16.987654, 45.876543),
    'widget': const CustomeMarkerWidgit(price: 678.90),
  },
  {
    'id': '3',
    'globalKey': GlobalKey(),
    'position': const LatLng(14.246810, 43.567890),
    'widget': const CustomeMarkerWidgit(price: 987.65),
  },
  {
    'id': '4',
    'globalKey': GlobalKey(),
    'position': const LatLng(15.135792, 44.975318),
    'widget': const CustomeMarkerWidgit(price: 543.21),
  },
  {
    'id': '5',
    'globalKey': GlobalKey(),
    'position': const LatLng(16.112233, 45.998877),
    'widget': const CustomeMarkerWidgit(price: 1234.56),
  },
  {
    'id': '6',
    'globalKey': GlobalKey(),
    'position': const LatLng(14.131415, 43.161718),
    'widget': const CustomeMarkerWidgit(price: 7890.12),
  },
  {
    'id': '7',
    'globalKey': GlobalKey(),
    'position': const LatLng(15.192837, 44.293801),
    'widget': const CustomeMarkerWidgit(price: 6543.21),
  },
  {
    'id': '8',
    'globalKey': GlobalKey(),
    'position': const LatLng(16.987654, 45.123456),
    'widget': const CustomeMarkerWidgit(price: 210.987),
  },
  {
    'id': '9',
    'globalKey': GlobalKey(),
    'position': const LatLng(14.567890, 43.987654),
    'widget': const CustomeMarkerWidgit(price: 8765.432),
  },
  {
    'id': '10',
    'globalKey': GlobalKey(),
    'position': const LatLng(15.112233, 44.876543),
    'widget': const CustomeMarkerWidgit(price: 9876.543),
  },
  {
    'id': '11',
    'globalKey': GlobalKey(),
    'position': const LatLng(16.223344, 45.765432),
    'widget': const CustomeMarkerWidgit(price: 345.678),
  },
  {
    'id': '12',
    'globalKey': GlobalKey(),
    'position': const LatLng(14.334455, 43.654321),
    'widget': const CustomeMarkerWidgit(price: 5678.901),
  },
  {
    'id': '13',
    'globalKey': GlobalKey(),
    'position': const LatLng(15.445566, 44.543210),
    'widget': const CustomeMarkerWidgit(price: 12345.678),
  },
  {
    'id': '14',
    'globalKey': GlobalKey(),
    'position': const LatLng(16.556677, 45.432109),
    'widget': const CustomeMarkerWidgit(price: 8765.4321),
  },
  {
    'id': '15',
    'globalKey': GlobalKey(),
    'position': const LatLng(14.667788, 43.321098),
    'widget': const CustomeMarkerWidgit(price: 98765.4321),
  },
  {
    'id': '16',
    'globalKey': GlobalKey(),
    'position': const LatLng(15.778899, 44.210987),
    'widget': const CustomeMarkerWidgit(price: 123456.789),
  },
  {
    'id': '17',
    'globalKey': GlobalKey(),
    'position': const LatLng(16.889900, 45.109876),
    'widget': const CustomeMarkerWidgit(price: 98765.43210),
  },
  {
    'id': '18',
    'globalKey': GlobalKey(),
    'position': const LatLng(14.998877, 43.098765),
    'widget': const CustomeMarkerWidgit(price: 87654.3210),
  },
  {
    'id': '19',
    'globalKey': GlobalKey(),
    'position': const LatLng(15.876543, 44.987654),
    'widget': const CustomeMarkerWidgit(price: 987654.3210),
  },
  {
    'id': '20',
    'globalKey': GlobalKey(),
    'position': const LatLng(16.765432, 45.876543),
    'widget': const CustomeMarkerWidgit(price: 1234567.890),
  },
];



class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _controller;
  final Map<String, Marker> _markers = {};
  bool _isLoaded = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _onBuildCompleted());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildContainerMap(),
          buildPositionedBackIcon(),
          buildPositionedSearchBar(),

        ],

      ),
    );
  }

  Positioned buildPositionedSearchBar() {
    return Positioned(
          top: 100,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Container(
                width: 327,
                height: 70,
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
        );
  }

  Positioned buildPositionedBackIcon() {
    return Positioned(
          top: 35,
          right: 19,
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(25),
            child: Container(
              width: 56,
              height: 56,

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
        );
  }

  Container buildContainerMap() {
    return Container(
          child: _isLoaded? GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController c) {
              _controller = c;
              changeMapMode(_controller!);
            },
            markers: _markers.values.toSet(),

          ): ListView(
            children: [
              for(int i=0; i<data.length; i++)
                Center(
                  child: Transform.translate(
                    offset: Offset(
                      -MediaQuery.of(context).size.width * 2,
                      -MediaQuery.of(context).size.height * 2,
                    ),
                    child: RepaintBoundary(
                      key: data[i]['globalKey'],
                      child: data[i]['widget'],
                    ),
                  ),
                ),
            ],

          ),
        );
  }

  Future<void> _onBuildCompleted() async {
    await Future.wait(
      data.map((value) async {
        // Introduce a delay before generating markers
        await Future.delayed(Duration(milliseconds: 100));
        Marker marker = await _generateMarkersFromWidgets(value);
        _markers[marker.markerId.value] = marker;
      }),
    );
    setState(() {
      _isLoaded = true;
    });
  }

  Future<Marker> _generateMarkersFromWidgets(Map<String, dynamic> data) async {
    try {
      GlobalKey globalKey = data['globalKey'];

      // Check if the GlobalKey is not null and has a current context
      if (globalKey != null && globalKey.currentContext != null) {
        RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

        ui.Image image = await boundary.toImage(pixelRatio: 2);
        ByteData? byteData = await image.toByteData(
          format: ui.ImageByteFormat.png,
        );

        return Marker(
          markerId: MarkerId(data['id']),
          position: data['position'],
          icon: BitmapDescriptor.fromBytes(
            byteData!.buffer.asUint8List(),
          ),
          onTap:  ()async{
            showBottomSheet(context,data['widget'].price, 4.5);
          },

        );
      } else {
        // Handle the case where GlobalKey or its context is null
        print('Error: GlobalKey or its context is null');
        // You can return a default Marker or handle the error in any way you prefer
        return Marker(markerId: MarkerId('default'), position: LatLng(0.0,0.0));
      }
    } catch (error) {
      print('Error during marker generation: $error');
      // Optionally, rethrow the exception to propagate it further if needed
      // throw error;
      // You can also return a default Marker or handle the error in any way you prefer
      return Marker(markerId: MarkerId('default'), position: LatLng(0, 0));
    }
  }



  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(14.5678337, 43.2232772),
    zoom: 7,
  );

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

  // handle when clicking the marker
  void showBottomSheet(BuildContext context, double price, double rating) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return second_section(image: "assets/images/image3.png",name: "hello world", address: "fifth street", price: 2000, rating: 4.5);
      },
    );
  }

}

