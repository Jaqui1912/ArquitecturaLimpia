import 'package:flutter/material.dart';
import '../../domain/entities/number_comparison_result.dart';
import '../../domain/usecases/get_max_number.dart';

class ComparisonProvider extends ChangeNotifier {
  final TextEditingController number1Controller = TextEditingController();
  final TextEditingController number2Controller = TextEditingController();
  final TextEditingController number3Controller = TextEditingController();

  NumberComparisonResult? _comparisonResult;
  NumberComparisonResult? get comparisonResult => _comparisonResult;

  final GetMaxNumber _getMaxNumber = GetMaxNumber();

  void compareNumbers() {
    final int number1 = int.tryParse(number1Controller.text) ?? 0;
    final int number2 = int.tryParse(number2Controller.text) ?? 0;
    final int number3 = int.tryParse(number3Controller.text) ?? 0;

    final maxNumber = _getMaxNumber.call(number1, number2, number3);

    _comparisonResult = NumberComparisonResult(
      number1: number1,
      number2: number2,
      number3: number3,
      maxNumber: maxNumber,
    );

    notifyListeners();
  }
}
