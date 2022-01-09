import 'package:flutter/material.dart';
import 'package:weather_telypay/modules/data.dart';

class Weather extends StatefulWidget {
  Weather({Key? key, required this.response}) : super(key: key);
  final dynamic response;
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final _data = Data();
  late Response _response;
  @override
  void initState() {
    // TODO: implement initState
    _response = widget.response;
    super.initState();
  }

// to translate the sunrise and sunset to readable time
  String getClockInUtcPlus3Hours(int timeSinceEpochInSec) {
    final time = DateTime.fromMillisecondsSinceEpoch(timeSinceEpochInSec * 1000,
            isUtc: true)
        .add(const Duration(hours: 3));
    return '${time.hour}:${time.second}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _response.cityName,
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${_response.temp.temp}°',
              style: TextStyle(color: Colors.blue.shade600, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "SunRise: ${getClockInUtcPlus3Hours(_response.srs.sunRise)}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "SunRise: ${getClockInUtcPlus3Hours(_response.srs.sunRise)}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Back"))
          ],
        ),
      ),
    );
  }
}
