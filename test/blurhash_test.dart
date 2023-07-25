import 'package:flutter_test/flutter_test.dart';
import 'package:blurhash/blurhash.dart';

void main() {
  final blurHash = BlurHash();
  test('blurHashDecode', () async {
    var bytes = await blurHash.decode("", 32, 32);
    expect(bytes, null);
  });
}
