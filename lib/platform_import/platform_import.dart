import 'package:flutter/material.dart';
import 'package:flutter_use_case/platform_import/text_show/platform_show.dart';
import 'package:flutter_use_case/platform_import/text_show/text_show.dart'
    if (dart.library.html) 'package:flutter_use_case/platform_import/text_show/text_show_web.dart'
    as show;

class PlatformImport extends StatefulWidget {
  const PlatformImport({super.key});

  @override
  State<PlatformImport> createState() => _PlatformImportState();
}

class _PlatformImportState extends State<PlatformImport> {
  final PlatformShow platformShow = show.createAdapter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(platformShow.platformName()),
      ),
    );
  }
}
