import 'package:flutter/material.dart';

import 'home_page.dart';
import 'blurhash_image_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: "Home"),
                Tab(text: "BlurHash Image"),
              ],
            ),
            title: const Text('BlurHash Example'),
          ),
          body: TabBarView(
            children: [const HomePage(), BlurHashImagePage()],
          ),
        ),
      ),
    );
  }
}
