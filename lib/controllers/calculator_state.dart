// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

enum CalculatorStatus {
  initial,
  result,
  error,
}

class CalculatorState extends Equatable {
  final String equation;
  final num result;
  final CalculatorStatus status;

  const CalculatorState({
    required this.equation,
    required this.result,
    required this.status,
  });

  factory CalculatorState.initial() {
    return const CalculatorState(
      equation: '',
      result: 0,
      status: CalculatorStatus.initial,
    );
  }

  bool get showResult => status == CalculatorStatus.result;

  bool get hasError => status == CalculatorStatus.error;

  @override
  List<Object?> get props => [equation, result, status];

  CalculatorState copyWith({
    String? equation,
    num? result,
    CalculatorStatus? status,
  }) {
    return CalculatorState(
      equation: equation ?? this.equation,
      result: result ?? this.result,
      status: status ?? this.status,
    );
  }
}
