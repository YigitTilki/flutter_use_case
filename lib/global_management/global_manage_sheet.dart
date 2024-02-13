import 'package:flutter/material.dart';

class GlobalManageSheet extends StatelessWidget {
  const GlobalManageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.looks_4)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.looks_5)),
      ],
    );
  }
}
