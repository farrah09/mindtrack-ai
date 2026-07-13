import 'package:flutter/material.dart';

import '../constants/app_durations.dart';

/// Fades and gently slides its child up when it first appears.
///
/// Used for subtle content entrances (cards, empty states). Respects the
/// platform "reduce motion" accessibility setting by skipping the slide.
class EntranceFade extends StatefulWidget {
  const EntranceFade(
      {super.key, this.delay = Duration.zero, required this.child});

  /// Optional delay before the entrance starts, for light staggering.
  final Duration delay;

  final Widget child;

  @override
  State<EntranceFade> createState() => _EntranceFadeState();
}

class _EntranceFadeState extends State<EntranceFade>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: AppDurations.medium,
  );

  late final Animation<double> _opacity =
      CurvedAnimation(parent: _controller, curve: Curves.easeOut);

  late final Animation<Offset> _offset = Tween<Offset>(
    begin: const Offset(0, 0.04),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: AppCurves.enter));

  @override
  void initState() {
    super.initState();
    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future<void>.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    if (reduceMotion) {
      return widget.child;
    }
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(position: _offset, child: widget.child),
    );
  }
}
