import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:blurhash/blurhash.dart';
import 'package:transparent_image/transparent_image.dart';

class BlurHashImage extends StatefulWidget {
  const BlurHashImage(
      {Key? key,
      required this.blurHash,
      required this.image,
      this.width,
      this.height,
      this.fit = BoxFit.cover})
      : super(key: key);

  final String blurHash;
  final String image;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  State<BlurHashImage> createState() => _BlurHashImageState();
}

class _BlurHashImageState extends State<BlurHashImage> {
  Uint8List? _imageDataBytes;
  final blurHash = BlurHash();

  @override
  void initState() {
    super.initState();
    blurHashDecode();
  }

  Future blurHashDecode() async {
    Uint8List? imageDataBytes;

    try {
      imageDataBytes = await blurHash.decode(widget.blurHash, 32, 32);
    } on PlatformException catch (e) {
      throw Exception(e.message);
    }

    setState(() {
      _imageDataBytes = imageDataBytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _imageDataBytes == null
        ? SizedBox(width: widget.width, height: widget.height)
        : Stack(
            children: <Widget>[
              FractionallySizedBox(
                widthFactor: 1,
                child: Image.memory(
                  _imageDataBytes!,
                  width: widget.width,
                  height: widget.height,
                  fit: widget.fit,
                ),
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: widget.image,
                  width: widget.width,
                  height: widget.height,
                  fit: widget.fit,
                ),
              )
            ],
          );
  }
}
