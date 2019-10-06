import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class BlurHash {
  static const MethodChannel _channel = const MethodChannel('blurhash');

  static Future<Uint8List> decode(String blurHash, int width, int height,
      {double punch = 1.0}) async {
    final Uint8List pixels = await _channel.invokeMethod(
        'blurHashDecode', <String, dynamic>{
      "blurHash": blurHash,
      "width": width,
      "height": height,
      "punch": punch
    });
    return pixels;
  }
}
