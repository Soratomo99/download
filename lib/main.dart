import 'dart:developer';
import 'dart:io';

import 'package:download_image/download_method.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DownLoadImage());
}

class DownLoadImage extends StatelessWidget {
  const DownLoadImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isOpen = false;
  // File? file;
  @override
  Widget build(BuildContext context) {
    if (!isOpen) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: const NetworkImage(
                    "https://cdn.donmai.us/original/c9/64/__hu_tao_genshin_impact_drawn_by_sofra__c96454042803c46975cbb5a1a5aae005.jpg"),
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              GestureDetector(
                onTap: () async {
                  // await downloadImg();
                  // await getImage();
                  await download();
                  log("done");
                  setState(() {
                    isOpen = true;
                  });
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "Download",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Image.file(File(
              "/data/user/0/com.example.download_image/app_flutter/downloads/image_test.png")),
        ),
      );
    }
  }
}
