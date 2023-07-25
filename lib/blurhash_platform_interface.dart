import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'blurhash_method_channel.dart';

abstract class BlurHashPlatform extends PlatformInterface {
  /// Constructs a BlurHashPlatform.
  BlurHashPlatform() : super(token: _token);

  static final Object _token = Object();

  static BlurHashPlatform _instance = MethodChannelBlurHash();

  /// The default instance of [BlurHashPlatform] to use.
  ///
  /// Defaults to [MethodChannelBlurHash].
  static BlurHashPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BlurHashPlatform] when
  /// they register themselves.
  static set instance(BlurHashPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String> encode(Uint8List image, int componentX, int componentY) {
    throw UnimplementedError('encode() has not been implemented.');
  }

  Future<Uint8List?> decode(String blurHash, int width, int height,
      {double punch = 1.0, bool useCache = true}) {
    throw UnimplementedError('decode() has not been implemented.');
  }
}
