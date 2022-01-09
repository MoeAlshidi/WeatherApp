import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Data {
  //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
  Future<Response> getWeather(String city) async {
    final queryPara = {
      'q': city,
      'appid': '53d6e5672d026564ccfa193bf8d6481d',
      'units': 'imperial',
    };
    final uri =
        Uri.http('api.openweathermap.org', "/data/2.5/weather", queryPara);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return Response.fromJson(json);
  }
}

class Response {
  final String cityName;
  final Temperature temp;

  final Srs srs;

  Response({required this.cityName, required this.temp, required this.srs});
  factory Response.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final tempMain = json['main'];

    final srsSYS = json['sys'];
    final srs = Srs.fromJson(srsSYS);
    final temp = Temperature.fromJson(tempMain);

    return Response(
      cityName: cityName,
      temp: temp,
      srs: srs,
    );
  }
}

class Temperature {
  final double temp;
  Temperature({required this.temp});
  factory Temperature.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'];
    return Temperature(temp: temp);
  }
}

// sunset and sunrise
class Srs {
  final int sunRise;
  final int sunSet;
  Srs({required this.sunRise, required this.sunSet});
  factory Srs.fromJson(Map<String, dynamic> json) {
    final sunRise = json['sunrise'];
    final sunSet = json['sunset'];
    return Srs(sunRise: sunRise, sunSet: sunSet);
  }
}
