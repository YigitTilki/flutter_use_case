import 'package:flutter/material.dart';
import 'package:flutter_use_case/view_mixin/parent_home_view_mixin.dart';

class ParentHomeView extends StatefulWidget {
  const ParentHomeView({super.key});

  @override
  State<ParentHomeView> createState() => _ParentHomeViewState();
}

class _ParentHomeViewState extends State<ParentHomeView>
    with ParentHomeViewMixin {
  final ValueNotifier<bool> _isLoadingNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: sendRequestForService,
      ),
      appBar: AppBar(
        title: const Text('Parent Home'),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: _isLoadingNotifier,
          builder: (context, value, child) {
            if (!value) return const Text('Okay');
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  @override
  Future<void> showDialogForType(ParentHomeResult value) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(value.name),
        content: Text(value.name),
      ),
    );
  }

  @override
  void showProgress(bool value) {
    _isLoadingNotifier.value = value;
  }
}
