import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}
final _globalKey = GlobalKey();
class _MapPageState extends State<MapPage> {

  GoogleMapController? _controller;
  List<Marker> _markers = [
    Marker(
      markerId: MarkerId('marker1'),
      position: LatLng(15.359313, 44.226226),
      infoWindow: InfoWindow(
        title: 'Marker 1',
        snippet: 'Price: \$100',
      ),
      // icon: BitmapDescriptor.fromBytes(widget2Image() as Uint8List),
    ),
    Marker(
      markerId: MarkerId('marker2'),
      position: LatLng(15.360141, 44.270515),

      infoWindow: InfoWindow(
        title: 'Marker 2',
        snippet: 'Price: \$150',
      ),
      visible: false
    ),
    // Add more markers as needed

  ];

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildContainerMap(),
          Positioned(
            top: 35,
            right: 19,
            child: InkWell(
              onTap: (){

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
          ),

          Positioned(
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
          )

        ],

      ),
    );
  }

  Container buildContainerMap() {
    return Container(
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController c) {
              _controller = c;
              changeMapMode(_controller!);
            },
            markers: Set.from(_markers),

          ),
        );
  }
}

Future<Uint8List> widget2Image() async {
  final RenderRepaintBoundary boundary =
  _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  final image = await boundary.toImage(pixelRatio: 1);
  final byteData = await image.toByteData(format: ImageByteFormat.png);
  final pngBytes = byteData!.buffer.asUint8List();
  return pngBytes;
}
// class CustomMarkerIcon extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.blue,
//         borderRadius: BorderRadius.circular(50.0),
//       ),
//       child: Icon(
//         Icons.location_on,
//         color: Colors.white,
//         size: 30.0,
//       ),
//     );
//   }
//
// }