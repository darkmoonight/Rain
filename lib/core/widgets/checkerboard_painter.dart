import 'package:flutter/material.dart';

/// Checkerboard pattern for transparent color previews and alpha sliders.
class CheckerboardPainter extends CustomPainter {
  const CheckerboardPainter({
    required this.light,
    required this.dark,
    this.columns = 4,
    this.rows = 4,
  });

  final Color light;
  final Color dark;
  final int columns;
  final int rows;

  /// Paints a checkerboard without creating a [CustomPainter] delegate.
  static void paintPattern(
    Canvas canvas,
    Size size, {
    required Color light,
    required Color dark,
    int columns = 4,
    int rows = 4,
  }) {
    if (columns <= 0 || rows <= 0) return;

    final cellWidth = size.width / columns;
    final cellHeight = size.height / rows;

    for (var row = 0; row < rows; row++) {
      for (var col = 0; col < columns; col++) {
        final paint = Paint()..color = (row + col).isEven ? light : dark;
        canvas.drawRect(
          Rect.fromLTWH(
            col * cellWidth,
            row * cellHeight,
            cellWidth,
            cellHeight,
          ),
          paint,
        );
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintPattern(
      canvas,
      size,
      light: light,
      dark: dark,
      columns: columns,
      rows: rows,
    );
  }

  @override
  bool shouldRepaint(covariant CheckerboardPainter oldDelegate) =>
      oldDelegate.light != light ||
      oldDelegate.dark != dark ||
      oldDelegate.columns != columns ||
      oldDelegate.rows != rows;
}
