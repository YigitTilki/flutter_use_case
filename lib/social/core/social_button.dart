import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_use_case/social/core/social_adaptor.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.adapter,
    required this.onCompleted,
    super.key,
  });
  final SocialAdapter adapter;
  final void Function(String token) onCompleted;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        final response = await GlobalException.make<String>(
          adapter.make,
        );
        if (response == null || response.isEmpty) {
          return;
        }
        onCompleted.call(response);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: adapter.model.backgroundColor,
        foregroundColor: adapter.model.foregroundColor,
      ),
      icon: Icon(adapter.model.icon),
      label: Text(adapter.model.title),
    );
  }
}

class GlobalException {
  static Future<T?> make<T>(AsyncValueGetter<T?> onOperation) async {
    try {
      final response = await onOperation.call();
      if (response == null) {
        throw Exception('$T data is null $response');
      }
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('$e');
      }
      return null;
    }
  }
}
