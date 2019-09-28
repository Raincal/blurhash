import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class Blurhash {
  static const MethodChannel _channel = const MethodChannel('blurhash');

  static Future<Uint8List> decode(String blurhash, int width, int height,
      {double punch = 1.0}) async {
    final Uint8List pixels = await _channel.invokeMethod(
        'blurhashDecode', <String, dynamic>{
      "blurhash": blurhash,
      "width": width,
      "height": height,
      "punch": punch
    });
    return pixels;
  }
}
