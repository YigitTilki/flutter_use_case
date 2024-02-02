import 'package:flutter/material.dart';
import 'package:flutter_use_case/view_mixin/parent_home_view.dart';

enum ParentHomeResult { first, second, third }

mixin ParentHomeViewMixin on State<ParentHomeView> {
  void showDialogForType(ParentHomeResult value);
  // ignore: avoid_positional_boolean_parameters
  void showProgress(bool value);

  Future<void> sendRequestForService() async {
    showProgress(true);
    final response = await _callService();
    showProgress(false);
    if (!mounted) return;
    await _showDialogServiceResponse(response);
    setState(() {});
  }

  Future<ParentHomeResult> _callService() async {
    final response = await Future.any<ParentHomeResult>({
      Future.delayed(const Duration(seconds: 2), () => ParentHomeResult.first),
      Future.delayed(const Duration(seconds: 2), () => ParentHomeResult.second),
      Future.delayed(const Duration(seconds: 2), () => ParentHomeResult.third),
    });
    return response;
  }

  Future<void> _showDialogServiceResponse(ParentHomeResult data) async {
    switch (data) {
      case ParentHomeResult.first:
        showDialogForType(ParentHomeResult.first);
      case ParentHomeResult.second:
        showDialogForType(ParentHomeResult.second);
      case ParentHomeResult.third:
        showDialogForType(ParentHomeResult.third);
    }
  }
}
