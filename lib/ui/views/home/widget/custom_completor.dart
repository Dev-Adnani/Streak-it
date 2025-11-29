import 'package:flutter/material.dart';

class CompletionWidget extends StatefulWidget {
  final int completion; // Current completion status
  final int total; // Total number of segments
  final Color completedColor; // Color for completed segments
  final Color incompleteColor; // Color for incomplete segments
  final double size; // Size of the widget

  const CompletionWidget({
    super.key,
    required this.completion,
    this.total = 4, // Total number of segments (can be changed)
    this.completedColor = Colors.green,
    this.incompleteColor = Colors.grey,
    this.size = 30,
  });

  @override
  CompletionWidgetState createState() => CompletionWidgetState();
}

class CompletionWidgetState extends State<CompletionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = Tween<double>(begin: 0, end: widget.completion.toDouble())
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant CompletionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.completion != oldWidget.completion) {
      _animation = Tween<double>(
        begin: oldWidget.completion.toDouble(),
        end: widget.completion.toDouble(),
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ));
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: widget.size,
              height: widget.size,
              child: CustomPaint(
                painter: CompletionPainter(
                  completion: _animation.value,
                  total: widget.total,
                  completedColor: widget.completedColor,
                  incompleteColor: widget.incompleteColor,
                ),
              ),
            ),
            Icon(
              Icons.check,
              color: widget.completedColor,
              size: widget.size * 0.5,
            ),
          ],
        );
      },
    );
  }
}

class CompletionPainter extends CustomPainter {
  final double completion; // Now a double for smooth transitions
  final int total;
  final Color completedColor;
  final Color incompleteColor;

  CompletionPainter({
    required this.completion,
    required this.total,
    required this.completedColor,
    required this.incompleteColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint completedPaint = Paint()
      ..color = completedColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final Paint incompletePaint = Paint()
      ..color = incompleteColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final double radius = (size.width / 2) - 4;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double anglePerSegment = 2 * 3.14159265359 / total;

    for (int i = 0; i < total; i++) {
      final Paint paint = i < completion ? completedPaint : incompletePaint;

      final double startAngle = anglePerSegment * i;
      final double sweepAngle = anglePerSegment - 0.1;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
