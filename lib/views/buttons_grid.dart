import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/views/button_tile.dart';
import 'package:flutter/material.dart';

class ButtonsGrid extends StatelessWidget {
  const ButtonsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kSecondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView(
          padding: const EdgeInsets.all(5),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1,
            crossAxisSpacing: 25,
            mainAxisSpacing: 25,
          ),
          children: const [
            ButtonTile(label: 'AC', type: ButtonType.action),
            ButtonTile(label: '⌫', type: ButtonType.action),
            ButtonTile(label: '+/-', type: ButtonType.mathematical),
            ButtonTile(label: '%', type: ButtonType.mathematical),
            // ROW 2
            ButtonTile(label: '7'),
            ButtonTile(label: '8'),
            ButtonTile(label: '9'),
            ButtonTile(label: '÷', type: ButtonType.mathematical),
            // ROW 3
            ButtonTile(label: '4'),
            ButtonTile(label: '5'),
            ButtonTile(label: '6'),
            ButtonTile(label: 'x', type: ButtonType.mathematical),
            // ROW 4
            ButtonTile(label: '1'),
            ButtonTile(label: '2'),
            ButtonTile(label: '3'),
            ButtonTile(label: '-', type: ButtonType.mathematical),
            // ROW 5
            ButtonTile(label: '0'),
            ButtonTile(label: '.'),
            ButtonTile(label: '=', type: ButtonType.mathematical),
            ButtonTile(label: '+', type: ButtonType.mathematical),
          ],
        ),
      ),
    );
  }
}
