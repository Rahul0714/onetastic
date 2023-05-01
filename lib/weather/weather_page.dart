import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  bool serviceStatus = false;
  bool hasPermission = false;
  late LocationPermission permission;
  late Position position;
  String? timeZone;
  String? timeZoneAbbr;
  double? elevation;
  List? time;
  List? tempMax;
  List? tempMin;
  List? sunrise;
  List? sunset;
  List? uvIndex;

  bool _isLoading = false;
  @override
  void initState() {
    checkGPS();
    super.initState();
  }

  checkGPS() async {
    serviceStatus = await Geolocator.isLocationServiceEnabled();
    if (serviceStatus) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print("Location Permission Denied");
        } else if (permission == LocationPermission.deniedForever) {
          print("Location Permission Denied Forever");
        } else {
          hasPermission = true;
        }
      } else {
        hasPermission = true;
      }
      if (hasPermission) {
        setState(() {});
        getLocation();
      } else {
        print("GPS not enabled turn on GPS");
      }
      setState(() {});
    }
  }

  getLocation() async {
    setState(() {
      _isLoading = true;
    });
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude.toString() + " " + position.longitude.toString());
    var res;
    if (position.latitude.toString().isNotEmpty &&
        position.longitude.toString().isNotEmpty) {
      res = await http.get(
        Uri.parse(
            'https://api.open-meteo.com/v1/forecast?latitude=18.68&longitude=73.84&daily=temperature_2m_max,temperature_2m_min,sunrise,sunset,uv_index_max&timezone=auto'),
      );
      var data = json.decode(res.body);
      print(data);
      timeZone = data['timezone'];
      timeZoneAbbr = data['timezone_abbreviation'];
      elevation = data['elevation'];
      time = data['daily']['time'];
      tempMax = data['daily']['temperature_2m_max'];
      tempMin = data['daily']['temperature_2m_min'];
      sunrise = data['daily']['sunrise'];
      sunset = data['daily']['sunset'];
      uvIndex = data['daily']['uv_index_max'];
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: double.maxFinite,
                  child: Text(
                    timeZone!,
                    style: const TextStyle(fontSize: 21, color: Colors.white),
                  ),
                ),
                Container(
                  height: 100,
                  width: double.maxFinite,
                  child: Text(
                    tempMax![0].toString(),
                    style: const TextStyle(fontSize: 21, color: Colors.white),
                  ),
                ),
              ],
            ),
          );
  }
}
