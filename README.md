# blurhash

[![pub package](https://img.shields.io/pub/v/blurhash?style=flat-square)](https://pub.dartlang.org/packages/blurhash)

Compact representation of a placeholder for an image.

### Platform Support

| Android | iOS | Web |
|:-------:|:---:|:---:|
|    ✔️   |  ✔️  |  ✔️  |

<img src="https://raw.githubusercontent.com/Raincal/blurhash/master/blurhash.png" width="375">

## Usage

To use this plugin, add `blurhash` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

### Example

```dart
final blurHash = BlurHash();

void blurHashEncode() async {
  ByteData bytes = await rootBundle.load("image.jpg");
  Uint8List pixels = bytes.buffer.asUint8List();
  var blurHash = await blurHash.encode(pixels, 4, 3);
}

void blurHashDecode() async {
  Uint8List? imageDataBytes;
  try {
    imageDataBytes = await blurHash.decode(blurhash, 20, 12);
  } on PlatformException catch (e) {
    throw Exception(e.message);
  }
}
```
