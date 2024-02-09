import 'dart:io';

import 'package:flutter_use_case/platform_import/text_show/platform_show.dart';

PlatformShow get createAdapter => TextShowAccepted();

class TextShowAccepted implements PlatformShow {
  @override
  String platformName() {
    return '${HttpStatus.accepted}';
  }
}
