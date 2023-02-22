import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WebImageDownloader {
  static Future<void> downloadImage(
      GlobalKey globalKey, String fileName) async {
    final RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3);

    html.AnchorElement(href: await _imageToDataUrl(image))
      ..setAttribute('download', fileName)
      ..click();
  }

  static Future<String> _imageToDataUrl(ui.Image image) async {
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    return 'data:image/png;base64,${base64Encode(byteData!.buffer.asUint8List())}';
  }
}
