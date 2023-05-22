import 'package:flutter_test/flutter_test.dart';
import 'package:blurhash/blurhash.dart';

void main() {
  test('blurHashDecode', () async {
    var bytes = await BlurHash.decode("", 32, 32);
    expect(bytes, null);
  });
}
