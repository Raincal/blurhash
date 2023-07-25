import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'blurhash_platform_interface.dart';

/// An implementation of [BlurHashPlatform] that uses method channels.
class MethodChannelBlurHash extends BlurHashPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('blurhash');

  @override
  Future<String> encode(Uint8List image, int componentX, int componentY) async {
    final String blurHash =
        await methodChannel.invokeMethod('blurHashEncode', <String, dynamic>{
      "image": image,
      "componentX": componentX,
      "componentY": componentY,
    });
    return blurHash;
  }

  @override
  Future<Uint8List?> decode(String blurHash, int width, int height,
      {double punch = 1.0, bool useCache = true}) async {
    final Uint8List pixels =
        await methodChannel.invokeMethod('blurHashDecode', <String, dynamic>{
      "blurHash": blurHash,
      "width": width,
      "height": height,
      "punch": punch,
      "useCache": useCache
    });
    return pixels;
  }
}
