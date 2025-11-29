import 'package:flutter/material.dart';

class AnimatedMetricsRow extends StatelessWidget {
  final List<Widget> metrics;

  const AnimatedMetricsRow({
    super.key,
    required this.metrics,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: metrics.asMap().entries.map((entry) {
        final index = entry.key;
        final widget = entry.value;

        return TweenAnimationBuilder<Offset>(
          tween: Tween<Offset>(
            begin: Offset(index % 2 == 0 ? -1 : 1, 0),
            end: Offset.zero,
          ),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          builder: (context, offset, child) {
            return Transform.translate(offset: offset, child: child);
          },
          child: widget,
        );
      }).toList(),
    );
  }
}
