import 'package:flutter/material.dart';
import 'package:flutter_use_case/basic-mvvm/basic_view_model.dart';
import 'package:flutter_use_case/basic-mvvm/core/basic_cache.dart';
import 'package:flutter_use_case/basic-mvvm/view/basic_view_mixin.dart';

class BasicView extends StatefulWidget {
  const BasicView({super.key});

  @override
  State<BasicView> createState() => _BasicViewState();
}

class _BasicViewState extends State<BasicView> with BasicViewMixin {
  final BasicViewModel _viewModel = BasicViewModel(BasicCache());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: userNameController,
            onChanged: onControllerChange,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: 'Enter a UserName',
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: isValidForTextController,
            builder: (context, value, child) {
              return ElevatedButton(
                onPressed: value == false
                    ? null
                    : () async {
                        final response =
                            await _viewModel.controlToUserName(basicModel);
                        await controlToResult(result: response);
                      },
                child: const Text('Press'),
              );
            },
          ),
        ],
      ),
    );
  }
}
