import 'package:flutter/material.dart';

abstract class SocialAdapter {
  Future<String?> make();
  SocialAdapterModel get model;
}

class SocialAdapterModel {
  SocialAdapterModel({
    required this.title,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.icon,
  });

  factory SocialAdapterModel.apple() => SocialAdapterModel(
        title: 'Apple',
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        icon: Icons.apple,
      );
  factory SocialAdapterModel.google() => SocialAdapterModel(
        title: 'Google',
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFFDD4B39),
        icon: Icons.g_mobiledata,
      );
  factory SocialAdapterModel.facebook() => SocialAdapterModel(
        title: 'Facebook',
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF3B5998),
        icon: Icons.facebook,
      );

  final String title;
  final Color foregroundColor;
  final Color backgroundColor;
  final IconData icon;
}

class FacebookAdapter implements SocialAdapter {
  @override
  Future<String?> make() async {
    return toString();
  }

  @override
  final SocialAdapterModel model = SocialAdapterModel.facebook();
}

class AppleAdapter implements SocialAdapter {
  @override
  Future<String?> make() async {
    return toString();
  }

  @override
  final SocialAdapterModel model = SocialAdapterModel.apple();
}

class GoogleAdapter implements SocialAdapter {
  @override
  Future<String?> make() async {
    throw Exception('Google adapter is not implemented $this');
  }

  @override
  final SocialAdapterModel model = SocialAdapterModel.google();
}
