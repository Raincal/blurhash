import 'package:flutter/material.dart';

import 'blurhash_image.dart';

class BlurHashImagePage extends StatelessWidget {
  final List<String> _blurHashList = [
    "LEHV6nWB2yk8pyoJadR*.7kCMdnj",
    "LGF5]+Yk^6#M@-5c,1J5@[or[Q6.",
    "L6Pj0^i_.AyE_3t7t7R**0o#DgR4",
    "LKO2?U%2Tw=w]~RBVZRi};RPxuwH"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 8 / 5,
        ),
        itemCount: _blurHashList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: BlurHashImage(
              blurHash: _blurHashList[index],
              image: "https://blurha.sh/assets/images/img${index + 1}.jpg",
            ),
          );
        },
      ),
    );
  }
}
