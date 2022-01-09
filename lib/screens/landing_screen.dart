import 'package:flutter/material.dart';
import 'package:weather_telypay/modules/data.dart';
import 'package:weather_telypay/screens/weather_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _textController = TextEditingController();
  final _data = Data();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(labelText: "City.."),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final responses = await _data.getWeather(_textController.text);
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Weather(
                          response: responses,
                        ),
                      ));
                });
              },
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
