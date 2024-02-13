import 'package:flutter/material.dart';
import 'package:flutter_use_case/global_management/global_manage_sheet.dart';
import 'package:flutter_use_case/global_management/global_manage_view.dart';

class GlobalManageDetail extends StatefulWidget {
  const GlobalManageDetail({super.key});

  @override
  State<GlobalManageDetail> createState() => _GlobalManageDetailState();
}

class _GlobalManageDetailState extends State<GlobalManageDetail> {
  int _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, GlobalNavigationModel<int>(_currentValue));
        },
        child: const Text('save'),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(_currentValue.toString()),
        actions: [
          IconButton(
            onPressed: () async {
              final result = await showModalBottomSheet<bool>(
                context: context,
                builder: (context) {
                  return const GlobalManageSheet();
                },
              );
              if (result ?? false) {
                if (!mounted) return;
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: TextField(
        maxLength: 1,
        onChanged: (value) {
          final numberValue = int.tryParse(value);
          if (numberValue == null) return;
          setState(() {
            _currentValue = numberValue;
          });
        },
      ),
    );
  }
}
