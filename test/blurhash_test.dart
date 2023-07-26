import 'package:blurhash/blurhash_method_channel.dart';
import 'package:blurhash/blurhash_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:blurhash/blurhash.dart';

class MockBlurHashPlatform
    with MockPlatformInterfaceMixin
    implements BlurHashPlatform {
  @override
  Future<String> encode(Uint8List image, int componentX, int componentY) =>
      Future.value('');

  @override
  Future<Uint8List?> decode(String blurHash, int width, int height,
          {double punch = 1.0, bool useCache = true}) =>
      Future.value(Uint8List(0));
}

void main() {
  final BlurHashPlatform initialPlatform = BlurHashPlatform.instance;
  MockBlurHashPlatform fakePlatform = MockBlurHashPlatform();
  BlurHashPlatform.instance = fakePlatform;

  test('$MethodChannelBlurHash is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBlurHash>());
  });

  test('blurHashEncode', () async {
    expect(await BlurHash.encode(Uint8List(0), 32, 32), '');
  });

  test('blurHashDecode', () async {
    expect(await BlurHash.decode("", 32, 32), []);
  });
}
