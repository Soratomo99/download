import 'dart:async';

import 'download_web.dart' // Stub implementation
    if (dart.library.io) 'download_mobile.dart' // dart:io implementation
    if (dart.library.html) 'download_web.dart'; // dart:html implementation

Future download() async {
  await fileFromImageUrl();
}
