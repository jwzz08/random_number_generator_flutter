import 'dart:math';

import 'package:flutter/material.dart';

import '../component/number_row.dart';
import '../constant/color.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNumber;

  const SettingsScreen({super.key, required this.maxNumber});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 1000;

  @override
  void initState() {
    super.initState();

    maxNumber = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: SafeArea(
          child: Padding(
            //좌우 여백
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              //좌우 꽉차게 정렬
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Body(maxNumber: maxNumber),
                _Footer(
                    maxNumber: maxNumber,
                    onSliderChanged: onSliderChanged,
                    onButtonPressed: onButtonPressed),
              ],
            ),
          ),
        ));
  }

  void onSliderChanged(double val) {
    setState(() {
      maxNumber = val;
    });
  }

  void onButtonPressed() {
    Navigator.of(context).pop(maxNumber.toInt());
  }
}

class _Body extends StatelessWidget {
  final double maxNumber;

  const _Body({Key? key, required this.maxNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(
        number: maxNumber.toInt()
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double>? onSliderChanged;
  final VoidCallback onButtonPressed;

  const _Footer(
      {super.key,
      required this.onSliderChanged,
      required this.maxNumber,
      required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
            value: maxNumber,
            min: 1000,
            max: 100000,
            onChanged: onSliderChanged),
        ElevatedButton(
            onPressed: onButtonPressed,
            child: Text('저장!', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              primary: RED_COLOR,
            ))
      ],
    );
  }
}
