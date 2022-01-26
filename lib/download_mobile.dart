import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future fileFromImageUrl() async {
  await Permission.storage.shouldShowRequestRationale;
  if (await Permission.storage.request().isGranted) {
    const String url =
        "https://cdn.donmai.us/original/c9/64/__hu_tao_genshin_impact_drawn_by_sofra__c96454042803c46975cbb5a1a5aae005.jpg";

    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    final documentDirectory = await getApplicationDocumentsDirectory();
    final path = await Directory(documentDirectory.path + '/' + 'downloads/')
        .create(recursive: false);
    if ((await path.exists())) {
      log(path.path);
      final file =
          await File(join(documentDirectory.path, 'downloads/image_test.png'))
              .create(recursive: true);
      log(file.path);
      file.writeAsBytesSync(bytes);
      print("exist");
    } else {
      // TODO:
      print("not exist");
      path.create();
    }

    // String dir = (await getApplicationDocumentsDirectory()).path;
    // File file = File('$dir/${"test.png"}');
    // await file.writeAsBytes(bytes);
  }
}
