import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String path = "//media/external/images/media/54";
  String name = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // var imageId = await ImageDownloader.downloadImage(
            //     "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1280px-Image_created_with_a_mobile_phone.png");
            // var fileName = await ImageDownloader.findName(imageId!);
            // var pathImg = await ImageDownloader.findPath(imageId);

            var response = await Dio().get(
                "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",
                options: Options(responseType: ResponseType.bytes));
            final Map result = await ImageGallerySaver.saveImage(
                Uint8List.fromList(response.data),
                quality: 100,
                // quality: 60,
                name: "hello");
            print(result);
            setState(() {
              String key = "";
              for (var key in result.keys) {
                print(key);
                key = key;
                break;
              }
              path = result[key] ?? "";
              name = result[key] ?? "";
              // path = result ?? "";
              // name = result ?? "";
            });
          },
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(path),
                width: 200,
              ),
              Text(name)
            ],
          ),
        ),
      ),
    );
  }
}
