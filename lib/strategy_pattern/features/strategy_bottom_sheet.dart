import 'package:flutter/material.dart';
import 'package:flutter_use_case/strategy_pattern/core/strategy_context.dart';

@immutable
class StrategyBottom with Operation {
  const StrategyBottom(this.result);

  final StrategyResult result;
  @override
  Future<StrategyResult?> execute(BuildContext context) async {
    final response = await showModalBottomSheet<StrategyResult?>(
      context: context,
      builder: (context) {
        return StrategyBottomSheet(
          result: result,
        );
      },
    );
    return response;
  }
}

class StrategyBottomSheet extends StatelessWidget {
  const StrategyBottomSheet({required this.result, super.key});
  final StrategyResult result;

  @override
  Widget build(BuildContext context) {
    if (result == StrategyResult.failure) {
      return const Text('Has a problem');
    }
    return const Icon(
      Icons.check,
      color: Colors.green,
      size: 50,
    );
  }
}
