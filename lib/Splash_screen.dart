import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Welcome_screen.dart';
import 'home/navigation/bloc/navigation_bloc.dart';
import 'home/navigation/bloc/navigation_event.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key});
  @override
  _SplashPageState createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> radiusAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    radiusAnimation = Tween<double>(
      begin: 50,
      end: 200,
    ).animate(controller);
    controller.forward().whenComplete(() {
      context.read<NavigationBloc>().add(NavigateWelcomeToSignup());
/* Navigator.pushReplacement(
context,
MaterialPageRoute(builder: (context) => Welcome()),
);*/
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFA7C4D4),
      alignment: Alignment.center,
      child: FollowCurve2D(
        path: path,
        duration: const Duration(seconds: 2),
        child: AnimatedCircleAvatar(
          radiusAnimation: radiusAnimation,
          imagePath: 'assets/Images/logo.png',
        ),
      ),
    );
  }
}
final CatmullRomSpline path = CatmullRomSpline(
  const <Offset>[
    Offset(0.5, 0.5),
    Offset(0.05, 0.75),
    Offset(0.18, 0.23),
    Offset(0.32, 0.04),
    Offset(0.73, 0.5),
    Offset(0.42, 0.74),
    Offset(0.73, 0.01),
    Offset(0.93, 0.93),
    Offset(0.05, 0.75),
    Offset(0.5, 0.5),
  ],
  startHandle: const Offset(0.93, 0.93),
  endHandle: const Offset(0.18, 0.23),
);
class AnimatedCircleAvatar extends StatelessWidget {
  const AnimatedCircleAvatar({
    Key? key,
    required this.radiusAnimation,
    required this.imagePath,
  }) : super(key: key);
  final Animation<double> radiusAnimation;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radiusAnimation.value,
      backgroundImage: AssetImage(imagePath),
    );
  }
}
class FollowCurve2D extends StatefulWidget {
  const FollowCurve2D({
    Key? key,
    this.curve = Curves.easeInOut,
    required this.child,
    this.duration = const Duration(seconds: 0),
    required this.path,
  }) : super(key: key);
  final Curve2D path;
  final Curve curve;
  final Duration duration;
  final Widget child;
  @override
  State<FollowCurve2D> createState() => _FollowCurve2DState();
}
class _FollowCurve2DState extends State<FollowCurve2D>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: widget.curve);
    controller.forward();
    controller.addListener(() => setState(() {}));
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Offset position =
        widget.path.transform(animation.value) * 2.0 - const Offset(1.0, 1.0);
    return Align(
      alignment: Alignment(position.dx, position.dy),
      child: widget.child,
    );
  }
}