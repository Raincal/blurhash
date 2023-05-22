import 'package:flutter/material.dart';

import 'blurhash_image.dart';

class BlurHashImagePage extends StatelessWidget {
  BlurHashImagePage({super.key});

  final List<String> _blurHashList = [
    "LEHV6nWB2yk8pyoJadR*.7kCMdnj",
    "LGF5]+Yk^6#M@-5c,1J5@[or[Q6.",
    "L6Pj0^i_.AyE_3t7t7R**0o#DgR4",
    "LKO2?U%2Tw=w]~RBVZRi};RPxuwH"
  ];

  final List<String> _imageList = [
    "https://blurha.sh/12c2aca29ea896a628be.jpg",
    "https://blurha.sh/e08adedc9f82ade9f9d5.jpg",
    "https://blurha.sh/a355ab362a07a267e078.jpg",
    "https://blurha.sh/ea9e499f8080ce9956a8.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 8 / 5,
        ),
        itemCount: _blurHashList.length,
        itemBuilder: (BuildContext context, int index) {
          return BlurHashImage(
            blurHash: _blurHashList[index],
            image: _imageList[index],
          );
        },
      ),
    );
  }
}
