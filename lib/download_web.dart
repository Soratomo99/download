import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart'
    show consolidateHttpClientResponseBytes, kIsWeb;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

Future fileFromImageUrl() async {
  const String url =
      "https://cdn.donmai.us/original/c9/64/__hu_tao_genshin_impact_drawn_by_sofra__c96454042803c46975cbb5a1a5aae005.jpg";
  final uri = Uri.parse(url);

  final response = await http.get(uri);
  var data = response.bodyBytes;
  final content = base64Encode(response.bodyBytes);
  if (kIsWeb) {
    var anchorElement = html.AnchorElement()
      ..setAttribute("download", "test.jpeg")
      // ..setAttribute("target", "")
      ..setAttribute("href",
          "data:application/octet-stream;charset=utf-16le;base64,$content")
      ..click()
      ..remove();
    log(anchorElement.toString());
  }
}
