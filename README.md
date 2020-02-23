# blurhash

[![pub package](https://img.shields.io/pub/v/blurhash?style=flat-square)](https://pub.dartlang.org/packages/blurhash)

A Flutter plugin for iOS and Android to decode a BlurHash string.

<img src="https://raw.githubusercontent.com/Raincal/blurhash/master/blurhash.png" width="375">

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
  Uint8List _imageDataBytes;

  @override
  void initState() {
    super.initState();
    blurHashDecode();
  }

  Future<void> blurHashDecode() async {
    Uint8List imageDataBytes;

    try {
      // Decodes a BlurHash string to bytes
      imageDataBytes = await BlurHash.decode("LBAdAqof00WCqZj[PDay0.WB}pof", 32, 32);
    } on PlatformException catch (e) {
      print(e.message);
    }

    if (!mounted) return;

    setState(() {
      _imageDataBytes = imageDataBytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BlurHash example app'),
        ),
        body: Center(
          child: _imageDataBytes != null
              ? Image.memory(_imageDataBytes, width: 256, fit: BoxFit.cover)
              : Container(),
        ),
      ),
    );
  }
}
```
