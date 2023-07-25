import 'dart:async';
import 'package:flutter/services.dart';

import 'blurhash_platform_interface.dart';

class BlurHash {
  Future<String> encode(Uint8List image, int componentX, int componentY) {
    return BlurHashPlatform.instance.encode(image, componentX, componentY);
  }

  Future<Uint8List?> decode(String blurHash, int width, int height,
      {double punch = 1.0, bool useCache = true}) {
    return BlurHashPlatform.instance
        .decode(blurHash, width, height, punch: punch, useCache: useCache);
  }
}
