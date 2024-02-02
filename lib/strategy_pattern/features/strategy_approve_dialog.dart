import 'package:flutter/material.dart';
import 'package:flutter_use_case/strategy_pattern/core/strategy_context.dart';
import 'package:kartal/kartal.dart';

@immutable
class StrategyApprove with Operation {
  const StrategyApprove();
  @override
  Future<StrategyResult?> execute(BuildContext context) async {
    final response = await showDialog<StrategyResult?>(
      context: context,
      builder: (context) {
        return const StrategyApproveDialog();
      },
    );
    return response;
  }
}

class StrategyApproveDialog extends StatelessWidget {
  const StrategyApproveDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          const Text('----- Random Approve -----'),
          ElevatedButton(
            onPressed: () {
              context.route.pop(StrategyResult.success);
            },
            child: const Icon(Icons.check),
          ),
        ],
      ),
    );
  }
}
