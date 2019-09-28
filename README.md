# blurhash

[![pub package](https://img.shields.io/pub/v/blurhash?style=flat-square)](https://pub.dartlang.org/packages/blurhash)

A Flutter plugin for iOS and Android to decode a BlurHash string.

## Usage

To use this plugin, add `blurhash` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

### Example

```dart
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Import package
import 'package:blurhash/blurhash.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Uint8List imageDataBytes;

  @override
  void initState() {
    super.initState();
    blurhashDecode();
  }

  Future<void> blurhashDecode() async {
    Uint8List _imageDataBytes;

    try {
      // Decodes a blurhash string to bytes
      _imageDataBytes = await Blurhash.decode("LBAdAqof00WCqZj[PDay0.WB}pof", 32, 32);
    } on PlatformException catch (e) {
      print(e.message);
    }

    if (!mounted) return;

    setState(() {
      imageDataBytes = _imageDataBytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Blurhash example app'),
        ),
        body: Center(
          child: imageDataBytes != null
              ? Image.memory(imageDataBytes, width: 256, fit: BoxFit.cover)
              : Container(),
        ),
      ),
    );
  }
}
```
