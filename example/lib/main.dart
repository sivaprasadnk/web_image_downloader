import 'package:flutter/material.dart';
import 'package:web_image_downloader/web_image_downloader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Image Downloader example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Web Image Downloader example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RepaintBoundary(
              key: globalKey,
              child: Image.asset('assets/image.png'),
            ),
            const SizedBox(height: 50),
            IconButton(
              onPressed: () {
                WebImageDownloader.downloadImage(globalKey, 'image1.png');
              },
              icon: const Icon(Icons.download),
            )
          ],
        ),
      ),
    );
  }
}
