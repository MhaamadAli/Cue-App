import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  List<Marker> markers = [];
  LatLng? _currentPosition;

  void _addMarker(LatLng pos) {
    final marker = Marker(
      width: 50.0,
      height: 50.0,
      point: pos,
      child: const Icon(Icons.location_pin, color: Colors.red, size: 30),
    );
    setState(() {
      markers.add(marker);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: _currentPosition ?? const LatLng(45.5231, -122.6765),
          initialZoom: 13.0,
          onTap: (_, pos) => _addMarker(pos),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(markers: markers),
        ],
      ),
    );
  }
}
