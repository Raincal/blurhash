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
      imageDataBytes = await BlurHash.decode(_blurHashController.text, 20, 12);
    } on PlatformException catch (e) {
      print(e.message);
    }

    setState(() {
      _imageDataBytes = imageDataBytes;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              child: Wrap(spacing: 16.0, children: [
                FlatButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("Decode"),
                  onPressed: blurHashDecode,
                ),
                FlatButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("Encode1"),
                  onPressed: () {
                    blurHashEncode(1);
                  },
                ),
                FlatButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("Encode2"),
                  onPressed: () {
                    blurHashEncode(2);
                  },
                ),
                FlatButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("Encode3"),
                  onPressed: () {
                    blurHashEncode(3);
                  },
                ),
                FlatButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("Encode4"),
                  onPressed: () {
                    blurHashEncode(4);
                  },
                ),
                FlatButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
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
