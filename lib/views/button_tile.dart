import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ButtonType {
  mathematical, // +, -, √ ...
  number, // 1,2,3 ...
  action, // AC, delete one
}

class ButtonTile extends ConsumerWidget {
  const ButtonTile({
    super.key,
    required this.label,
    this.type = ButtonType.number,
  });

  final String label;
  final ButtonType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
        onTap: () {
          ref
              .read(calculatorControllerProvider.notifier)
              .buttonClicked(symbol: label, type: type);
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kBackgroundColor,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 40,
                // buttons of type action - red color
                // buttons of type mathematical - primary color
                color: type == ButtonType.mathematical
                    ? kPrimaryColor
                    : type == ButtonType.action
                        ? Colors.red
                        : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
