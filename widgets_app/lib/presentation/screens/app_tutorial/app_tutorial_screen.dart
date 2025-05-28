import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Busca la comida',
    'Sunt fugiat in aliqua in voluptate voluptate anim quis.',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Entrega rapida',
    'Aliquip cillum magna incididunt exercitation cillum officia tempor voluptate labore proident eu amet proident laborum.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Disfruta la comida',
    'Eu aliqua fugiat fugiat velit nulla quis quis excepteur amet est ipsum do laboris magna.',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatelessWidget {
  static const name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            physics: BouncingScrollPhysics(),
            children:
                slides
                    .map(
                      (slideData) => _Slide(
                        title: slideData.title,
                        caption: slideData.caption,
                        imageUrl: slideData.imageUrl,
                      ),
                    )
                    .toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Salir'),
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme(:titleLarge, :bodySmall) = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleLarge),
            const SizedBox(height: 20),
            Text(caption, style: bodySmall),
          ],
        ),
      ),
    );
  }
}
