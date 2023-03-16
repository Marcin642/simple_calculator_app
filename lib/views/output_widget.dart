import 'package:calculator_app/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OutputWidget extends ConsumerWidget {
  const OutputWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calculatorControllerProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              curve: Curves.linear,
              style: TextStyle(
                fontSize: state.showResult ? 32 : 64,
              ),
              child: Text(
                state.equation,
                style: TextStyle(
                  color: state.hasError ? Colors.red : null,
                ),
              ),
            ),
            if (state.showResult)
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear,
                style: TextStyle(fontSize: state.showResult ? 64 : 32),
                child: Text(
                  state.result.toString(),
                ),
              ),
            if (state.hasError)
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear,
                style: TextStyle(fontSize: state.showResult ? 64 : 32),
                child: Text(
                  'Bad expression',
                  style: TextStyle(
                    color: state.hasError ? Colors.red : null,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
