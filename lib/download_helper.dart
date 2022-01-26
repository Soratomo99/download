import 'dart:async';

import 'download_web.dart' // Stub implementation
    if (dart.library.io) 'download_mobile.dart' // dart:io implementation
    if (dart.library.html) 'download_web.dart'; // dart:html implementation

Future download() async {
  await fileFromImageUrl();
}

// var httpClient = HttpClient();
// Future<File> downloadFile(String url, String filename) async {
//   var request = await httpClient.getUrl(Uri.parse(url));
//   var response = await request.close();
//   var bytes = await consolidateHttpClientResponseBytes(response);
//   String dir = (await getApplicationDocumentsDirectory()).path;
//   File file = File('$dir/$filename');
//   await file.writeAsBytes(bytes);
//   return file;
// }
//
// Future getImage() async {
//   const String url =
//       "https://cdn.donmai.us/original/c9/64/__hu_tao_genshin_impact_drawn_by_sofra__c96454042803c46975cbb5a1a5aae005.jpg";
//   final uri = Uri.parse(url);
//
//   final Directory documentDirectory;
//
//   final response = await http.get(uri);
//   var data = response.bodyBytes;
//
//   launch(
//       "data:application/octet-stream;charset=utf-16le;base64,${base64Encode(data)}");
// }
