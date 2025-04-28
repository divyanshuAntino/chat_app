// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
part '../../../service/haptic.dart';

class AppClickable<T extends Widget> extends StatefulWidget {
  final T child;
  final Duration duration;
  final Duration reverseDuration;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final void Function(TapDownDetails)? onTapDown;
  final HitTestBehavior hitTestBehavior;
  final bool disabled;
  final bool inkSplash;
  final bool feedbackEnabled;
  final bool opacityEnabled;
  final EdgeInsets? padding;
  final void Function(DragEndDetails)? onLeftDragEnd;
  final void Function(DragEndDetails)? onRightDragEnd;

  const AppClickable({
    super.key,
    required this.child,
    this.onPressed,
    this.onLongPress,
    this.disabled = false,
    this.hitTestBehavior = HitTestBehavior.translucent,
    this.onTapDown,
    this.feedbackEnabled = true,
    this.duration = const Duration(milliseconds: 120),
    this.reverseDuration = const Duration(milliseconds: 80),
    this.opacityEnabled = true,
    this.inkSplash = false,
    this.padding,
    this.onLeftDragEnd,
    this.onRightDragEnd,
  });

  @override
  _AppClickableState createState() => _AppClickableState();
}

class _AppClickableState extends State<AppClickable>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> animation;

  AppHapticService haptics = AppHapticService._();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
      reverseDuration: widget.duration,
    );

    animation = Tween<double>(
      begin: 1.0,
      end: 0.5,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linearToEaseOut,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.disabled
        ? Opacity(
            opacity: 0.3,
            child: Padding(
              padding: widget.padding ?? EdgeInsets.zero,
              child: widget.child,
            ),
          )
        : !widget.inkSplash
            ? GestureDetector(
                behavior: widget.hitTestBehavior,
                onTap: () async {
                  if (widget.feedbackEnabled) {
                    haptics.hapticLight();

                    Feedback.forTap(context);
                  }

                  widget.onPressed?.call();

                  await animationController.forward();
                  await animationController.reverse();
                },
                onTapCancel: () {
                  animationController.reverse();
                },
                onTapDown: (tapDownDetails) {
                  if (widget.onTapDown != null) {
                    widget.onTapDown!(tapDownDetails);
                  }
                  animationController.forward();
                },
                onTapUp: (tapUpDetails) {
                  animationController.reverse();
                },
                onLongPressStart: (longPressStartDetails) {
                  animationController.forward();
                },
                onLongPress: () {
                  if (widget.feedbackEnabled) {
                    haptics.hapticMedium();

                    Feedback.forLongPress(context);
                  }

                  widget.onLongPress?.call();

                  animationController.reverse();
                },
                // onHorizontalDragEnd: (dragEndDetails) {
                //   final primaryVelocity = dragEndDetails.primaryVelocity;
                //   if (primaryVelocity != null) {
                //     if (primaryVelocity < 0) {
                //       widget.onLeftDragEnd?.call(dragEndDetails);
                //     } else if (primaryVelocity > 0) {
                //       widget.onRightDragEnd?.call(dragEndDetails);
                //     }
                //   }
                // },
                child: Padding(
                  padding: widget.padding ?? EdgeInsets.zero,
                  child: widget.opacityEnabled
                      ? KAnimatedOpacity(
                          animation: animation,
                          child: widget.child,
                        )
                      : widget.child,
                ),
              )
            : Stack(
                children: [
                  Padding(
                    padding: widget.padding ?? EdgeInsets.zero,
                    child: widget.opacityEnabled
                        ? KAnimatedOpacity(
                            animation: animation,
                            child: widget.child,
                          )
                        : widget.child,
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        highlightColor: const Color(0xFF282B2F),
                        splashColor: const Color(0xFF282B2F),
                        onTap: () async {
                          if (widget.feedbackEnabled) {
                            haptics.hapticLight();

                            Feedback.forTap(context);
                          }

                          widget.onPressed?.call();
                        },
                        onTapDown: (tapDownDetails) {
                          if (widget.onTapDown != null) {
                            widget.onTapDown!(tapDownDetails);
                          }
                        },
                        onLongPress: () {
                          if (widget.feedbackEnabled) {
                            haptics.hapticMedium();

                            Feedback.forLongPress(context);
                          }

                          widget.onLongPress?.call();
                        },
                        child: Container(),
                      ),
                    ),
                  ),
                ],
              );
  }
}

class KAnimatedOpacity extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const KAnimatedOpacity({
    super.key,
    required this.animation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
