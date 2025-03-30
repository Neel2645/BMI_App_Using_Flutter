import 'dart:async';

import 'package:bmi_app_using_flutter/bmi_app.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const Bmiapp();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber[300],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                  "https://cdn-icons-png.flaticon.com/128/10481/10481308.png"),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "BMI",
                style: TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 25, 14, 131),
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Calculator",
                style: TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 25, 14, 131),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
