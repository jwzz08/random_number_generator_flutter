import 'package:flutter/material.dart';

class NumberRow extends StatelessWidget {
  final int number;

  const NumberRow({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: number
//maxNumber이 double이기 때문에 int로 형변형 해줘야 함
//          .toInt()
// but 위의 maxNumber을 위로 뺄 때 int형으로 만들어줄거라 여기에서는 빼줌
          .toString()
          .split('')
          .map((e) => Image.asset(
                'asset/img/$e.png',
                width: 50.0,
                height: 70.0,
              ))
          .toList(),
    );
  }
}
