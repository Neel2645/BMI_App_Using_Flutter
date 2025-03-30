// ignore: file_names
// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class Bmiapp extends StatefulWidget {
  const Bmiapp({super.key});

  @override
  State<Bmiapp> createState() => _BmiappState();
}

class _BmiappState extends State<Bmiapp> {
  // ignore: non_constant_identifier_names
  int Gender = 0, height = 170, age = 25, weight = 65;
  double bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        centerTitle: true,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 105, 162, 39)),
        ),
      ),
      body: _buildui(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            bmi = weight / pow(height / 100, 2);
          });
        },
        child: const Icon(Icons.calculate),
      ),
    );
  }

  Widget _buildui() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        _genderSelected(),
        const SizedBox(
          height: 15,
        ),
        _heightInput(),
        const SizedBox(
          height: 15,
        ),
        _weightAndAgeInput(),
        const SizedBox(
          height: 15,
        ),
        _bmiResult(),
      ],
    );
  }

  Widget _genderSelected() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // color: Theme.of(context).colorScheme.primaryContainer,
        color: Colors.blue[200],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              IconButton(
                  color: Gender == 0
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black,
                  iconSize: 60,
                  onPressed: () {
                    setState(() {
                      Gender = 0;
                    });
                  },
                  icon: const Icon(Icons.male)),
              const Text(
                "Male",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                  color: Gender == 1
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black,
                  iconSize: 60,
                  onPressed: () {
                    setState(() {
                      Gender = 1;
                    });
                  },
                  icon: const Icon(Icons.female)),
              const Text(
                "Female",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _heightInput() {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: Theme.of(context).colorScheme.primaryContainer,
          color: Colors.blue[200],
        ),
        child: Column(
          children: [
            const Text(
              "Height",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Slider(
                min: 0,
                max: 300,
                divisions: 300,
                value: height.toDouble(),
                onChanged: (value) {
                  setState(() {
                    height = value.toInt();
                  });
                }),
            Text(
              "$height cm",
              style: const TextStyle(fontSize: 20),
            )
          ],
        ));
  }

  Widget _weightAndAgeInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _weightInput(),
        _ageInput(),
      ],
    );
  }

  Widget _weightInput() {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: Theme.of(context).colorScheme.primaryContainer,
          color: Colors.blue[200],
        ),
        child: Column(
          children: [
            const Text(
              "Weight",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            ItemCount(
                buttonSizeWidth: 53,
                buttonSizeHeight: 30,
                initialValue: weight,
                minValue: 30,
                maxValue: 350,
                onChanged: (value) {
                  setState(() {
                    weight = value.toInt();
                  });
                },
                decimalPlaces: 0)
          ],
        ));
  }

  Widget _ageInput() {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: Theme.of(context).colorScheme.primaryContainer,
          color: Colors.blue[200],
        ),
        child: Column(
          children: [
            const Text(
              "Age",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            ItemCount(
                buttonSizeWidth: 53,
                buttonSizeHeight: 30,
                initialValue: age,
                minValue: 0,
                maxValue: 150,
                onChanged: (value) {
                  setState(() {
                    age = value.toInt();
                  });
                },
                decimalPlaces: 0)
          ],
        ));
  }

  Widget _bmiResult() {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: Theme.of(context).colorScheme.primaryContainer,
          color: Colors.blue[200],
        ),
        child: Text(
          "BMI: ${bmi.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ));
  }
}
