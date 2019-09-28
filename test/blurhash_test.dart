import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blurhash/blurhash.dart';

void main() {
  const MethodChannel channel = MethodChannel('blurhash');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'blurhashDecode') {
        return null;
      }
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('blurhashDecode', () async {
    var bytes = await Blurhash.decode("", 32, 32);
    expect(bytes, null);
  });
}
