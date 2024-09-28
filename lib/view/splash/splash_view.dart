import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:thecat_rodgav/application/router/navigator.dart';
import 'package:thecat_rodgav/view/custom_widgets/responsive.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<AlignmentGeometry> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..forward();
    _animation = Tween<AlignmentGeometry>(
      begin: Alignment.topCenter,
      end: Alignment.center,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.decelerate,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.goCats();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CatResponsive(
      widget: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              const RiveAnimation.asset(
                'assets/animations/cat.riv',
                //controllers: [_controller],
                animations: ['Idle'],
              ),
              AlignTransition(
                alignment: _animation,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'CATBREEDS',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
