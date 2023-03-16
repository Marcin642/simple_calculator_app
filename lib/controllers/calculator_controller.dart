import 'package:calculator_app/controllers/calculator_state.dart';
import 'package:calculator_app/views/button_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends StateNotifier<CalculatorState> {
  CalculatorController() : super(CalculatorState.initial());

  void buttonClicked({required String symbol, required ButtonType type}) {
    if (symbol == '⌫') {
      _removeLast();
      return;
    } else if (symbol == 'AC') {
      _clear();
      return;
    } else if (symbol == '=') {
      if (state.equation.isNotEmpty) {
        state = state.copyWith(
          result: _getResult(),
          status: CalculatorStatus.result,
        );
      }
      return;
    } else if (symbol == '+/-') {
      if (state.equation.isNotEmpty) {
        state = state.copyWith(
          equation: '-(${state.equation})',
        );
        return;
      }
      return;
    }
    _addToEquation(symbol, type);
  }

  void _addToEquation(String symbol, ButtonType type) {
    if (state.equation.isEmpty) {
      if ((type == ButtonType.mathematical) && symbol != '-') return;
    } else if (state.equation.isNotEmpty) {
      final lastSymbol = state.equation.split('').last;
      if ((lastSymbol == 'x' ||
              lastSymbol == '%' ||
              lastSymbol == '+' ||
              lastSymbol == '-' ||
              lastSymbol == '÷') &&
          type == ButtonType.mathematical) {
        return;
      }
    }
    List<String> updatedEquation;
    if (state.showResult) {
      updatedEquation = state.result.toString().split('')..add(symbol);
    } else {
      updatedEquation = state.equation.split('')..add(symbol);
    }
    state = state.copyWith(
      equation: updatedEquation.join(),
      status: CalculatorStatus.initial,
    );
  }

  void _clear() {
    if (state.equation.isEmpty) return;
    state = state.copyWith(
      equation: '',
      result: 0,
      status: CalculatorStatus.initial,
    );
    return;
  }

  void _removeLast() {
    if (state.equation.isEmpty) return;
    final updatedEquation = state.equation.split('')..removeLast();
    state = state.copyWith(
      equation: updatedEquation.join(),
      status: CalculatorStatus.initial,
    );
  }

  num _getResult() {
    Map<String, String> replaceRules = {
      'x': '*',
      '÷': '/',
      '%': '/100',
    };
    String expression = state.equation;
    replaceRules.forEach((key, value) {
      expression = expression.replaceAll(key, value);
    });
    try {
      // parse expression into the expression tree
      Parser parser = Parser();
      Expression exp = parser.parse(expression);
      // create context model, which can hold variable values and evalue expressions on them
      ContextModel contextModel = ContextModel();
      // evaluate the expression tree

      num result = exp.evaluate(EvaluationType.REAL, contextModel);
      if (result % 1 == 0) {
        return result.toInt();
      } else {
        return result;
      }
    } catch (e) {
      state = state.copyWith(status: CalculatorStatus.error);
      throw Exception('Bad expression');
    }
  }
}

final calculatorControllerProvider =
    StateNotifierProvider<CalculatorController, CalculatorState>((ref) {
  return CalculatorController();
});
