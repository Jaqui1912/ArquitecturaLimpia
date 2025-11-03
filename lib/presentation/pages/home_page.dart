import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/comparison_provider.dart';
import '../widgets/number_input_field.dart';
import '../../domain/entities/number_comparison_result.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final comparisonProvider = Provider.of<ComparisonProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Comparator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            NumberInputField(
              labelText: 'Number 1',
              controller: comparisonProvider.number1Controller,
              onChanged: (value) {},
            ),
            NumberInputField(
              labelText: 'Number 2',
              controller: comparisonProvider.number2Controller,
              onChanged: (value) {},
            ),
            NumberInputField(
              labelText: 'Number 3',
              controller: comparisonProvider.number3Controller,
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                comparisonProvider.compareNumbers();
              },
              child: const Text('Compare'),
            ),
            const SizedBox(height: 20),
            Selector<ComparisonProvider, NumberComparisonResult?>(
              selector: (context, provider) => provider.comparisonResult,
              builder: (context, result, child) {
                if (result != null) {
                  return Text(
                    'El numero mayor es : ${result.maxNumber}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  );
                } else {
                  return const Text('Enter numbers and press compare.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
