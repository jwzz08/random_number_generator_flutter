import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';
import 'package:random_number_generator/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [
    123,
    456,
    789,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              _Header(),
              _Body(randomNumbers: randomNumbers ),
              _Footer(onPressed: onRandomNumberGenerate)
              
            ],
          ),
        ),
      ),
    );
  }

  void onRandomNumberGenerate() {

    final rand = Random();

    final Set<int> newNumbers = {};

    while (newNumbers.length != 3) {
      final number = rand.nextInt(1000);

      newNumbers.add(number);
      print(newNumbers);
    }

    setState(() {
      randomNumbers = newNumbers.toList();
    });

    print(Text('생성하기'));
  }

}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤숫자 생성기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return SettingsScreen();
              },)
            );
          },
          icon: Icon(Icons.settings),
          color: RED_COLOR,
        )
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNumbers;

  const _Body({super.key, required this.randomNumbers });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: randomNumbers
              .asMap()
              .entries
              .map((x) => Padding(
            padding: EdgeInsets.only(
                bottom: x.key == 2 ? 0 : 16.0),
            child: Row(
              children: x.value
                  .toString()
                  .split('')
                  .map((y) => Image.asset(
                'asset/img/$y.png',
                height: 70.0,
                width: 50.0,
              ))
                  .toList(),
            ),
          ))
              .toList()),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;

  const _Footer({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //무한대 값을 넣어주게 되면 가로로 꽉 차게 만들 수 있다, row와 expanded 사용해도 됨.
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text('생성하기!', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(primary: RED_COLOR),
        ));
  }
}

