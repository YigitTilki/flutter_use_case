import 'package:flutter/material.dart';
import 'package:flutter_use_case/basic-mvvm/basic_model.dart';
import 'package:flutter_use_case/basic-mvvm/basic_view.dart';
import 'package:flutter_use_case/view_mixin/parent_home_view.dart';
import 'package:kartal/kartal.dart';

mixin BasicViewMixin on State<BasicView> {
  final TextEditingController userNameController = TextEditingController();
  ValueNotifier<bool> isValidForTextController = ValueNotifier<bool>(false);

  String get valueForName => userNameController.value.text;
  BasicModel get basicModel => BasicModel(valueForName);

  void onControllerChange(String value) {
    isValidForTextController.value = value.length > 3;
  }

  Future<void> controlToResult({bool result = false}) async {
    if (result) {
      await context.route.navigateToPage(const ParentHomeView());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error')),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
  }
}
