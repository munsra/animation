import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationState();
}

class _AnimationState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late final Future<LottieComposition> _composition;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
    _composition = AssetLottie('assets/cat/cat.json').load();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool bookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lottie Animation'),
      ),
      body: Center(
          child: FutureBuilder<LottieComposition>(
        future: _composition,
        builder: (context, snapshot) {
          var composition = snapshot.data;
          if (composition != null) {
            return GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: 1000,
                height: 1000,
                child: Lottie(
                  composition: composition,
                  fit: BoxFit.fitWidth,
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )),
    );
  }
}
