import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// {@template animated_emoji}
/// A widget that shows an animated emoji from local assets.
///
/// [emoji] defines which emoji is displayed.
///
/// The animation is repeatedly played by default.
/// Change this behavior with [repeat] and [animate].
///
/// This example shows how to create a emoji that animates once.
///
/// ```dart
/// const AnimatedEmoji(
///   'blush',
///   size: 128,
///   repeat: false,
/// ),
/// ```
/// {@endtemplate}
class AnimatedEmoji extends StatelessWidget {
  /// Creates an animated emoji
  ///
  /// {@macro animated_emoji}
  const AnimatedEmoji(
    this.emojiName, {
    super.key,
    this.size,
    this.controller,
    this.repeat = true,
    this.animate = true,
    this.errorWidget,
    this.onLoaded,
  });

  /// The name of the emoji.
  ///
  /// Corresponds to the asset file name without the `.json` extension.
  final String emojiName;

  /// The size of the emoji.
  ///
  /// Defaults to the default icon size.
  final double? size;

  /// Whether to play the animation once or repeatedly.
  final bool repeat;

  /// Controls if the animation is active.
  final bool animate;

  /// Widget shown when the emoji fails to load.
  final Widget? errorWidget;

  /// [AnimationController] that controls the animation.
  final Animation<double>? controller;

  /// This function is called after the animation is successfully loaded.
  ///
  /// `duration` returns the duration of the emoji animation.
  /// This can be used to set the duration of an animation controller.
  ///
  /// ```dart
  /// onLoaded: (duration) {
  ///   // Get the duration of the animation.
  ///   controller.duration = duration;
  /// },
  /// ```
  final void Function(Duration duration)? onLoaded;

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    final iconSize = size ?? iconTheme.size;

    final assetName = 'assets/lottie/$emojiName.json';

    return SizedBox(
      height: iconSize,
      width: iconSize,
      child: Lottie.asset(
        assetName,
        repeat: repeat,
        animate: animate,
        controller: controller,
        errorBuilder: errorWidget != null
            ? (context, error, stackTrace) {
                return errorWidget!;
              }
            : null,
        onLoaded: (composition) {
          onLoaded?.call(composition.duration);
        },
      ),
    );
  }
}
