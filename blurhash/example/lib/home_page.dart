import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blurhash/blurhash.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Uint8List _imageDataBytes;
  TextEditingController _blurHashController =
      TextEditingController(text: "LEHV6nWB2yk8pyo0adR*.7kCMdnj");

  @override
  void initState() {
    super.initState();
    blurHashDecode();
  }

  void blurHashEncode(int index) async {
    ByteData bytes = await rootBundle.load("images/img$index.jpg");
    Uint8List pixels = bytes.buffer.asUint8List();
    var hash = await BlurHash.encode(pixels, 4, 3);
    _blurHashController.text = hash;
  }

  void blurHashDecode() async {
    Uint8List imageDataBytes;
    try {
      imageDataBytes = await BlurHash.decode(_blurHashController.text, 20, 12,
          useCache: false);
    } on PlatformException catch (e) {
      print(e.message);
    }

    setState(() {
      _imageDataBytes = imageDataBytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.blue,
      onSurface: Colors.blue[700],
      primary: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    );

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            TextField(
              controller: _blurHashController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Wrap(spacing: 16.0, runSpacing: 8.0, children: [
                TextButton(
                  style: flatButtonStyle,
                  child: Text("Decode"),
                  onPressed: blurHashDecode,
                ),
                TextButton(
                  style: flatButtonStyle,
                  child: Text("Encode1"),
                  onPressed: () {
                    blurHashEncode(1);
                  },
                ),
                TextButton(
                  style: flatButtonStyle,
                  child: Text("Encode2"),
                  onPressed: () {
                    blurHashEncode(2);
                  },
                ),
                TextButton(
                  style: flatButtonStyle,
                  child: Text("Encode3"),
                  onPressed: () {
                    blurHashEncode(3);
                  },
                ),
                TextButton(
                  style: flatButtonStyle,
                  child: Text("Encode4"),
                  onPressed: () {
                    blurHashEncode(4);
                  },
                ),
                TextButton(
                  style: flatButtonStyle,
                  child: Text("Encode5"),
                  onPressed: () {
                    blurHashEncode(5);
                  },
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: _imageDataBytes == null
                  ? Container()
                  : FractionallySizedBox(
                      widthFactor: 1,
                      child: Image.memory(
                        _imageDataBytes,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ]),
        )
      ],
    );
  }
}
