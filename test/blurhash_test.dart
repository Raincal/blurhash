import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blurhash/blurhash.dart';

void main() {
  const MethodChannel channel = MethodChannel('blurhash');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Blurhash.platformVersion, '42');
  });
}
