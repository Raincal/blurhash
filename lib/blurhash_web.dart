import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:image/image.dart' as img;

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:blurhash/blurhash_platform_interface.dart';

/// A web implementation of the BlurHashPlatform of the BlurHash plugin.
class BlurhashWeb extends BlurHashPlatform {
  /// Constructs a BlurhashWeb
  BlurhashWeb();

  static void registerWith(Registrar registrar) {
    BlurHashPlatform.instance = BlurhashWeb();
  }

  @override
  Future<String> encode(Uint8List image, int componentX, int componentY) async {
    final imageData = img.decodeImage(image);
    BlurHash blurhash =
        BlurHash.encode(imageData!, numCompX: componentX, numCompY: componentY);
    return blurhash.hash;
  }

  @override
  Future<Uint8List?> decode(String blurHash, int width, int height,
      {double punch = 1.0, bool useCache = true}) async {
    BlurHash brhash = BlurHash.decode(blurHash, punch: punch);
    img.Image image = brhash.toImage(width, height);
    return Uint8List.fromList(img.encodeJpg(image));
  }
}
