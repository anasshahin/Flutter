import 'dart:math';

import 'package:flutter/material.dart';
import 'package:study_flutter/BMI%20App/weight_and_age.dart';

import 'bmi_result.dart';
import 'gender_choice.dart';
import 'height_person.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  Color genderColorF = Colors.grey;
  Color genderColorM = Colors.grey;
  HeightPerson heightPerson = HeightPerson();
  WeightAndAge weightAndAgeF = WeightAndAge(
    write: true,
  );
  WeightAndAge weightAndAgeT = WeightAndAge(
    write: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Body mass index'),
          backgroundColor: Colors.greenAccent),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    child: GenderChoice(
                        genderType: 0, write: false, clickColor: genderColorF),
                    onTap: () {
                      setState(() {
                        GenderChoice.gender = 'Female';
                        genderColorF = Colors.greenAccent;
                        genderColorM = Colors.grey;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: GenderChoice(
                        genderType: 1, write: true, clickColor: genderColorM),
                    onTap: () {
                      setState(() {
                        GenderChoice.gender = 'Male';
                        genderColorM = Colors.greenAccent;
                        genderColorF = Colors.grey;
                      });
                    },
                  ),
                ),
              ],
            ),
            heightPerson,
            Row(
              children: [
                weightAndAgeF,
                weightAndAgeT,
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 15,
                left: 15,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    String healthStatus = '';
                    double x = 0;
                    x = weightAndAgeF.value /
                        (pow(heightPerson.value, 2) * pow(.1, 4));
                    if (18.5 >= x) {
                      healthStatus = 'UnderWeight';
                    } else if (18.5 < x && x <= 24.9) {
                      healthStatus = 'normal';
                    } else if (25 <= x && x <= 29.9) {
                      healthStatus = 'OverWeight';
                    } else if (x >= 30) {
                      healthStatus = 'Obese';
                    }
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ResultBMI(
                        gender: GenderChoice.gender,
                        height: heightPerson.value,
                        age: weightAndAgeT.value,
                        result: x.toStringAsFixed(2),
                        healthStatus: healthStatus,
                      ),
                    ));
                  },
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                           Size(double.infinity, MediaQuery.of(context).size.height/20)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.greenAccent)),
                  child: const Text(
                    'Calculator',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
