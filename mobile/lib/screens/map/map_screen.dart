import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  List<Marker> markers = [];
  LatLng? _currentPosition;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

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

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    LatLng currentLatLng = LatLng(position.latitude, position.longitude);
    setState(() {
      _currentPosition = currentLatLng;
      _mapController.move(_currentPosition!, 15);
      _addMarker(_currentPosition!);
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF06D6A0),
        onPressed: () {
          if (_currentPosition != null) {
            _mapController.move(_currentPosition!, 15);
          } else {
            _determinePosition();
          }
        },
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
