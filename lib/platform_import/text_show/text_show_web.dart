import 'dart:html';

import 'package:flutter_use_case/platform_import/text_show/platform_show.dart';

PlatformShow get createAdapter => TextShowAcceptedWeb();

class TextShowAcceptedWeb implements PlatformShow {
  @override
  String platformName() {
    return '${HttpStatus.accepted}';
  }
}
