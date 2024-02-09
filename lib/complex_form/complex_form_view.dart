import 'package:flutter/material.dart';
import 'package:flutter_use_case/complex_form/complex_data.dart';
import 'package:flutter_use_case/complex_form/complex_inherited.dart';

class ComplexFormView extends StatefulWidget {
  const ComplexFormView({super.key});

  @override
  State<ComplexFormView> createState() => _ComplexFormViewState();
}

class _ComplexFormViewState extends State<ComplexFormView> {
  ComplexData complexData = const ComplexData(email: 'Yidow');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex Form'),
      ),
      body: ComplexInherited(
        complexData: complexData,
        child: const _BuildForm(
          onValueUpdated: print,
        ),
      ),
    );
  }
}

class _BuildForm extends StatelessWidget {
  const _BuildForm({this.onValueUpdated});

  final ValueSetter<ComplexData>? onValueUpdated;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: ComplexInherited.of(context).formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _NameField(),
          const _EmailField(),
          const _PasswordField(),
          const _PhoneField(),
          ElevatedButton(
            onPressed: () {
              final complexData =
                  ComplexInherited.of(context).controlAndReturn();
              if (complexData == null) return;
              print(complexData);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

class _PhoneField extends StatelessWidget {
  const _PhoneField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ComplexInherited.of(context).nameController,
      validator: (value) => value?.isEmpty ?? true ? 'Name is Required' : null,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Phone',
        hintText: 'Enter your Phone',
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
        hintText: 'Enter your Password',
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ComplexInherited.of(context).emailController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
        hintText: 'Enter your Email',
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Name',
        hintText: 'Enter your Name',
      ),
    );
  }
}
