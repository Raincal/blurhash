import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blurhash/blurhash.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Uint8List? _imageDataBytes;
  final TextEditingController _blurHashController =
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
    Uint8List? imageDataBytes;
    try {
      imageDataBytes = await BlurHash.decode(_blurHashController.text, 20, 12,
          useCache: false);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    }

    setState(() {
      _imageDataBytes = imageDataBytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      disabledForegroundColor: Colors.blue[700]?.withOpacity(0.38),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              padding: const EdgeInsets.only(top: 16.0),
              child: Wrap(spacing: 16.0, runSpacing: 8.0, children: [
                TextButton(
                  style: flatButtonStyle,
                  onPressed: blurHashDecode,
                  child: const Text("Decode"),
                ),
                TextButton(
                  style: flatButtonStyle,
                  child: const Text("Encode1"),
                  onPressed: () {
                    blurHashEncode(1);
                  },
                ),
                TextButton(
                  style: flatButtonStyle,
                  child: const Text("Encode2"),
                  onPressed: () {
                    blurHashEncode(2);
                  },
                ),
                TextButton(
                  style: flatButtonStyle,
                  child: const Text("Encode3"),
                  onPressed: () {
                    blurHashEncode(3);
                  },
                ),
                TextButton(
                  style: flatButtonStyle,
                  child: const Text("Encode4"),
                  onPressed: () {
                    blurHashEncode(4);
                  },
                ),
                TextButton(
                  style: flatButtonStyle,
                  child: const Text("Encode5"),
                  onPressed: () {
                    blurHashEncode(5);
                  },
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: _imageDataBytes == null
                  ? Container()
                  : FractionallySizedBox(
                      widthFactor: 1,
                      child: Image.memory(
                        _imageDataBytes!,
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
