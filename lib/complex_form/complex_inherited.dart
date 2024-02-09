import 'package:flutter/material.dart';
import 'package:flutter_use_case/complex_form/complex_data.dart';

class ComplexInherited extends InheritedWidget {
  ComplexInherited({required super.child, this.complexData, super.key})
      : emailController = TextEditingController(text: complexData?.email);

  final ComplexData? complexData;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  bool updateShouldNotify(covariant ComplexInherited oldWidget) {
    return oldWidget.complexData != complexData;
  }

  ComplexData? controlAndReturn() {
    if (!formKey.currentState!.validate()) {
      return ComplexData(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
      );
    }
    return null;
  }

  static ComplexInherited of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<ComplexInherited>();
    assert(result != null, 'No ComplexInherited found in context');
    return result!;
  }
}
