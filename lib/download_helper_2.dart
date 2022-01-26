import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

Future downloadImg() async {
  const String url =
      "https://cdn.donmai.us/original/c9/64/__hu_tao_genshin_impact_drawn_by_sofra__c96454042803c46975cbb5a1a5aae005.jpg";
  final uri = Uri.parse(url);

  final response = await http.get(uri);
  var data = response.bodyBytes;
  final String content = base64Encode(response.bodyBytes);
  final urlDownload = 'data:application/octet-stream;base64,$content';
  String fileDownload =
      "<a download='custom-filename.jpg' href=$urlDownload> </a>";
  log(fileDownload);
  await launch(url);
}

Future launchURL() async {
  const String url =
      "https://cdn.donmai.us/original/c9/64/__hu_tao_genshin_impact_drawn_by_sofra__c96454042803c46975cbb5a1a5aae005.jpg";

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
