import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../ui/widgets/CustomeMarkerWidgit.dart';

abstract class Clusterable {
  final String markerId;
  final double latitude;
  final double longitude;
  final bool isCluster;
  final String? clusterId;
  final int? pointsSize;
  final String? childMarkerId;

  Clusterable({
    required this.markerId,
    required this.latitude,
    required this.longitude,
    this.isCluster = false,
    this.clusterId,
    this.pointsSize,
    this.childMarkerId,
  });
}

class MapMarker extends Clusterable {
  final GlobalKey globalKey;
  final CustomeMarkerWidgit widget;

  MapMarker({
    required String id,
    required LatLng position,
    required this.globalKey,
    required this.widget,
    bool isCluster = false,
    String? clusterId,
    int? pointsSize,
    String? childMarkerId,
  }) : super(
    markerId: id,
    latitude: position.latitude,
    longitude: position.longitude,
    isCluster: isCluster,
    clusterId: clusterId,
    pointsSize: pointsSize,
    childMarkerId: childMarkerId,
  );

  Future<Marker> toMarker() async {
    ui.Image markerImage = await widgetToImage(widget);
    ByteData? byteData = await markerImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uint8List = byteData!.buffer.asUint8List();

    return Marker(
      markerId: MarkerId(markerId),
      position: LatLng(
        latitude,
        longitude,
      ),
      icon: BitmapDescriptor.fromBytes(uint8List),
    );
  }

  Future<ui.Image> widgetToImage(Widget widget) async {
    RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    return image;
  }
}
